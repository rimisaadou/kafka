package org.example.listeners;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

@Component
public class KafkaListner {
    @KafkaListener(topics = "my-first-topic", groupId = "my-first-topic")
    public void listenGroupFoo(String message) {
        System.out.println("Received Message in group foo: " + message);
    }

    @KafkaListener(topics = "my-first-topic", groupId = "my-first-topic")
    public void listen(
            @Payload String message,
            @Header(KafkaHeaders.RECEIVED_KEY) String key,
            @Header(value = "custom-header", required = false) String customHeader) {

        System.out.println("Key: " + key);
        System.out.println("Value: " + message);
        System.out.println("Custom Header: " + customHeader);
    }
}
