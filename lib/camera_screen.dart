import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:developer' as developer;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'Interior_screen.dart'; // Import InteriorScreen

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  late CameraDescription _camera;
  bool _isRecording = false;
  List<Map<String, dynamic>> selectedImages = []; // Store multiple images

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      _camera = _cameras.first;
      _controller = CameraController(_camera, ResolutionPreset.high);
      await _controller.initialize();
      setState(() {});
    } catch (e) {
      developer.log('Error initializing camera: $e', name: 'CameraScreen');
    }
  }

  Future<void> _startVideoRecording() async {
    try {
      final Directory appDirectory = await getApplicationDocumentsDirectory();
      final String videoPath = '${appDirectory.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';
      await _controller.startVideoRecording();
      setState(() {
        _isRecording = true;
      });
      developer.log('Recording video to: $videoPath', name: 'CameraScreen');
    } catch (e) {
      developer.log('Error starting video recording: $e', name: 'CameraScreen');
    }
  }

  Future<void> _stopVideoRecording() async {
    try {
      final file = await _controller.stopVideoRecording();
      setState(() {
        _isRecording = false;
      });
      developer.log('Video recorded at: ${file.path}', name: 'CameraScreen');
    } catch (e) {
      developer.log('Error stopping video recording: $e', name: 'CameraScreen');
    }
  }

  Future<void> _openInteriorScreen() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const SizedBox(
          height: 400,
          child: InteriorScreen(),
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedImages.add({
          "path": result,
          "dx": 100.0, // Default X position
          "dy": 200.0, // Default Y position
        });
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(55, 127, 76, 1),
        title: const Text('Camera'),
      ),
      body: Stack(
        children: [
          CameraPreview(_controller),
          
          // Display selected images that can be moved and removed
          for (int i = 0; i < selectedImages.length; i++)
            Positioned(
              left: selectedImages[i]["dx"],
              top: selectedImages[i]["dy"],
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    selectedImages[i]["dx"] += details.delta.dx;
                    selectedImages[i]["dy"] += details.delta.dy;
                  });
                },
                child: Stack(
                  children: [
                    Image.asset(
                      selectedImages[i]["path"],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: GestureDetector(
                        onTap: () => _removeImage(i),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          Positioned(
            bottom: 50,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              onPressed: () async {
                if (_isRecording) {
                  await _stopVideoRecording();
                } else {
                  await _controller.takePicture();
                }
              },
              backgroundColor: const Color.fromRGBO(55, 127, 76, 1),
              child: Icon(
                _isRecording ? Icons.stop : Icons.add_a_photo,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            bottom: 150,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              onPressed: _isRecording ? null : _startVideoRecording,
              backgroundColor: const Color.fromRGBO(55, 127, 76, 1),
              child: const Icon(
                Icons.videocam,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            right: 20,
            child: FloatingActionButton(
              onPressed: _openInteriorScreen,
              backgroundColor: Colors.white,
              child: const Icon(Icons.add, color: Colors.green, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
