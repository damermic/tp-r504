from flask import Flask, render_template, request
import re

app = Flask(__name__)
 


@app.route('/newuser/', methods=['GET'])
def newuser():
    return render_template('user_form.html')

if __name__ == '__main__':
    app.run(debug=True)
    
