from flask import Flask, render_template
app = Flask(_name_)
@app.route('/')
def hello():
    greeting_message = "Hello from ArgoCD"
    return render_template('index.html', message=greeting_message)
if _name_ == '_main_':
    app.run(debug=True, host='0.0.0.0', port=5000)