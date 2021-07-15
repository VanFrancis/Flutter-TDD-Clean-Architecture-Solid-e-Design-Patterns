import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  Future<void>? auth() async {
    await httpClient.request(url: url, method: 'post');
  }
}

abstract class HttpClient {
  Future<void>? request({required String url, required String method});
}

class HttpClientSpy extends Mock implements HttpClient {}

main() {
  test('Should call HttpClient with correct values', () async {
    //Patterner - Triplo A
    //Arrange
    final httpClient = HttpClientSpy();
    final url = faker.internet.httpUrl(); //gera uma URL fake
    final sut = RemoteAuthentication(
        httpClient: httpClient, url: url); //é a classe que eu to testando

    //Action
    await sut.auth();

    //Assert
    verify(httpClient.request(url: url, method: 'post')).called(1);
  });
}
