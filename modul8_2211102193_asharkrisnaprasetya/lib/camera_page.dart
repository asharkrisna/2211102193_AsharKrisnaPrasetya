import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; //import camera package

//membuat class camerapage yang merupakan statefulwidget
class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

//membuat class _camerapagestate yang merupakan state dari camerapage
class _CameraPageState extends State<CameraPage> {
  CameraController? _controller; //membuat variabel_controller dengan tipe cameracontroller
  List<CameraDescription>? cameras; //membuat variabel camera dengan tipe list<camera...
  Future<void>? _initializeControllerFuture;

  @override
  //Membuat method inintate
  void initState() { //memanggil method initstate dari class induk
    super.initState(); //memanggil method _setupcamera 
    _setupCamera();
  }

  Future<void> _setupCamera() async { //membuat method _setupcamera dengan tipe future<void>
    cameras = await availableCameras(); //mengisi variable camera dengan data dari method availabelcamera
    _controller = CameraController(cameras![0], ResolutionPreset.high);
    _initializeControllerFuture = _controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    //membuat method dispose
    _controller?.dispose(); //memanggil method dispose
    super.dispose(); //memanggil method dispose dari class induk
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(title: Text("Camera")),
      body: CameraPreview(_controller!),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller!.takePicture();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Photo saved to: ${image.path}")),
            );
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
