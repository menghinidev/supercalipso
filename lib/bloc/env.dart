class EnvVariables {
  static const String isMockedKey = "USE_MOCKED_DATA_SOURCE";
  static const isMocked = String.fromEnvironment(isMockedKey, defaultValue: 'true') == 'true';
}
