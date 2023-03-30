class EnvVariables {
  static const String isMockedKey = "USE_MOCKED_DATA_SOURCE";
  static const isMocked = bool.hasEnvironment(isMockedKey) ? bool.fromEnvironment(isMockedKey) : true;
}
