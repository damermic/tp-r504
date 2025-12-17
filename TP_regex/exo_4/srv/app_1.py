from flask import Flask, render_template, request
import re

app = Flask(__name__)
 


@app.route('/newuser/', methods=['GET'])
def newuser():
    return render_template('user_form.html')

@app.route('/newuser/', methods=['POST'])
def newuser_post():
    text = request.form['text']
    
    if re.fullmatch(r'.{6,}', text) == None:
        return render_template('user_form.html', error_message="le mot de passe doit contenir au moins 6 caractères")
    elif re.search(r'[0-9]', text) == None:
        return render_template('user_form.html', error_message="le mot de passe doit contenir au moins un chiffre")
    elif re.search(r'[a-z]', text) == None:
        return render_template('user_form.html', error_message="le mot de passe doit contenir au moins une minuscule")
    elif re.search(r'[A-Z]', text) == None:
        return render_template('user_form.html', error_message="le mot de passe doit contenir au moins une majuscule")
    elif re.search(r'[@#$%]', text) == None:
        return render_template('user_form.html', error_message="le mot de passe doit contenir au moins un caractère spécial")
    else:
        return render_template('user_form.html', success=True)

if __name__ == '__main__':
    app.run(debug=True)
    
