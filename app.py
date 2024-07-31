from flask import Flask               # Import Flask module, flask is used in order to serve the output via the web 

app = Flask(__name__)                 # Create a Flask application instance

@app.route('/')                       # Define a route for the root URL
def hello_world():
    return "Hello world, my name's Luqman. Welcome to my Python app!" # Function to return the string when the root URL is accessed

if __name__ == '__main__':                 # Run the application if this file is executed as the main program
    app.run(host='0.0.0.0', port=80)       # Run the Flask app on all available IP addresses on port 
