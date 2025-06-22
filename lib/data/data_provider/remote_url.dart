class RemoteUrls {
  static const String rootUrl = "https://api.github.com/"; //test url

  static const String baseUrl = rootUrl;

  static String repoList = '${baseUrl}search/repositories';


  static imageUrl(String imageUrl) => rootUrl + imageUrl;
}
