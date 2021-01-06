import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:papercups_flutter/utils/utils.dart';

import '../lib/models/classes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Props", () {
    Props props;
    test('default values', () {
      props = Props(
        accountId: "this-is-an-account-id",
      );

      expect(props.accountId, "this-is-an-account-id");
      //expect(props.agentAvailableText, null);
      expect(props.baseUrl, "app.papercups.io");
      //expect(props.agentUnavailableText, null);
      expect(props.companyName, "Bot");
      expect(props.newMessagePlaceholder, "Start typing...");
      expect(props.primaryColor, null);
      expect(props.requireEmailUpfront, false);
      expect(props.scrollEnabled, true);
      expect(props.customer, null);
      expect(props.primaryGradient, null);
      expect(props.subtitle, "How can we help you?");
      expect(props.title, "Welcome!");
      expect(props.greeting, null);
    });
    test('are loaded correctly', () {
      props = Props(
          accountId: "this-is-an-account-id",
          //agentAvailableText: "test",
          //agentUnavailableText: "unavailable",
          baseUrl: "app.papercups.io",
          companyName: "name",
          greeting: "greeting",
          newMessagePlaceholder: "placeHolder",
          primaryColor: Color(0xffffff),
          requireEmailUpfront: true,
          scrollEnabled: true,
          customer: CustomerMetadata());

      expect(props.accountId, "this-is-an-account-id");
      //expect(props.agentAvailableText, "test");
      expect(props.baseUrl, "app.papercups.io");
      //expect(props.agentUnavailableText, "unavailable");
      expect(props.companyName, "name");
      expect(props.newMessagePlaceholder, "placeHolder");
      expect(props.primaryColor, Color(0xffffff));
      expect(props.requireEmailUpfront, true);
      expect(props.scrollEnabled, true);
      expect(props.customer.toJsonString(),
          '{"name":null,"email":null,"external_id":null}');
      expect(props.primaryGradient, null);
      expect(props.subtitle, "How can we help you?");
      expect(props.title, "Welcome!");
      expect(props.greeting, "greeting");
    });
  });

  group("Customer Metadata", () {
    CustomerMetadata cm;
    test('default values', () {
      cm = CustomerMetadata();

      expect(cm.email, null);
      expect(cm.externalId, null);
      expect(cm.name, null);
      expect(cm.otherMetadata, null);
      expect(
          cm.toJsonString(), '{"name":null,"email":null,"external_id":null}');
    });
    test('are loaded correctly', () {
      cm = CustomerMetadata(
          email: "test@test.com",
          externalId: "1234",
          name: "name",
          otherMetadata: {
            "Test": "string",
          });

      expect(cm.email, "test@test.com");
      expect(cm.externalId, "1234");
      expect(cm.name, "name");
      expect(cm.otherMetadata, {"Test": "string"});
      expect(cm.toJsonString(),
          '{"name":"name","email":"test@test.com","external_id":"1234","Test":"string"}');
    });
  });
  group('Theming', () {
    group("darken", () {
      test('throws assertion error when percent is not within 1 - 100 ', () {
        expect(() => darken(Colors.black, 0), throwsAssertionError);
      });

      test('Darkens the color by 10%', () {
        final color = Color.fromARGB(100, 100, 100, 100);
        final darkenedColor = darken(color, 10);
        expect(darkenedColor.alpha, equals(100));
        expect(darkenedColor.red, equals(90));
        expect(darkenedColor.blue, equals(90));
        expect(darkenedColor.green, equals(90));
      });
    });

    group("brighten", () {
      test('throws assertion error when percent is not within 1 - 100 ', () {
        expect(() => brighten(Colors.black, 101), throwsAssertionError);
      });

      test('Brightens the color by 10%', () {
        final color = Color.fromARGB(155, 155, 155, 155);
        final brightenedColor = brighten(color, 10);
        expect(brightenedColor.alpha, equals(155));
        expect(brightenedColor.red, equals(165));
        expect(brightenedColor.blue, equals(165));
        expect(brightenedColor.green, equals(165));
      });
    });
  });
}
