//Simple Utility Class that saves frames of an ongoing Process
//You can then create a video of the frames with FFmpeg https://www.ffmpeg.org/
//Example: https://hamelot.io/visualization/using-ffmpeg-to-convert-a-set-of-images-into-a-video/
class Recorder{
    static void saveFrameAs(String name){
        saveFrame(name);
    }
}