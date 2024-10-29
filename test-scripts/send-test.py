from paho.mqtt import client as mqtt_client
import time

broker = 'localhost'
port = 1883
topic = "test"
client_id = 'mqtt-test'

def on_connect(client, userdata, flags, rc, properties):
    if rc == 0:
        print("Connected to MQTT Broker!")
    else:
        print("Failed to connect, return code %d\n", rc)

# This is the Publisher

client = mqtt_client.Client(client_id=client_id, callback_api_version=mqtt_client.CallbackAPIVersion.VERSION2)

client.on_connect = on_connect
client.connect(broker, port)

time.sleep(1)

for i in range(1000):
    client.publish(topic, "Hello World x %d" % i)
    #time.sleep(0.05)