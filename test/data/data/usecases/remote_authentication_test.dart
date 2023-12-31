import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  test('should call HttpClient with correct URL', () async {
    final httpClient = HttpClientSpy();
    final url = faker.internet.httpUrl();
    final sut = RemonteAuthentication(httpClient: httpClient, url: url);
    when(httpClient.request(url: url)).thenAnswer((_) => Future.value());
    await sut.auth();
    verify(httpClient.request(url: url));
  });
}

abstract class HttpClient {
  Future<void> request({required String url});
}

class HttpClientSpy extends Mock implements HttpClient {}

class RemonteAuthentication {
  final HttpClient httpClient;
  final String url;
  RemonteAuthentication({required this.httpClient, required this.url});
  Future<void> auth() async {
    await httpClient.request(url: url);
  }
}
