class Helper {
  static getPixelPosition(
    double ratioX,
    double ratioY,
    double imageWidth,
    double imageHeight,
  ) {
    return {'x': ratioX * imageWidth, 'y': ratioY * imageHeight};
  }
}
