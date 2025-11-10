#!/bin/bash
set -e

KAFKA_BIN="/opt/kafka/bin"  # or /kafka/bin if that's the correct path

echo "⏳ Waiting for Kafka to be ready..."

for i in {1..60}; do
  if $KAFKA_BIN/kafka-topics.sh --bootstrap-server kafka:9092 --list >/dev/null 2>&1; then
    echo "✅ Kafka is ready!"
    break
  fi
  echo "Attempt $i/60: Kafka not ready yet, waiting 2s..."
  sleep 2
done

echo "📘 Creating default topic 'my-first-topic'..."
$KAFKA_BIN/kafka-topics.sh \
  --bootstrap-server kafka:9092 \
  --create \
  --topic my-first-topic \
  --partitions 1 \
  --replication-factor 1 \
  --if-not-exists

echo "📋 Listing all topics..."
$KAFKA_BIN/kafka-topics.sh --bootstrap-server kafka:9092 --list

echo "✅ Topic initialization complete!"
