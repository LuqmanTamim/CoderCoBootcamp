from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Hello world, my name's Luqman. Welcome to my Python app!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
