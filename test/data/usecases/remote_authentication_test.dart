import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:fordev/domain/usecases/usecases.dart';

import 'package:fordev/data/http/http.dart';
import 'package:fordev/data/usescases/usescases.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  late RemoteAuthentication sut;
  late final HttpClient httpClient;
  late String url;

  setUp(() {
    //Patterner - Triplo A
    //Arrange
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl(); //gera uma URL fake
    sut = RemoteAuthentication(
        httpClient: httpClient, url: url); //é a classe que eu to testando
  });
  test('Should call HttpClient with correct values', () async {
    final params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
    //Action
    await sut.auth(params);

    //Assert
    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret})).called(1);
  });
}
