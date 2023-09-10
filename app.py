from flask import Flask, render_template, request, url_for
from werkzeug.utils import secure_filename
import matlab.engine

app = Flask(__name__)

app.config["UPLOAD_FOLDER"] = "static/"

@app.route('/')
def home():
    return render_template('upload.html')


@app.route('/upload', methods = ['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        eng=matlab.engine.start_matlab() #started matlab engine process in bg

        f = request.files['image']
        filename = secure_filename(f.filename)
        full_filename=app.config['UPLOAD_FOLDER'] + filename

        f.save(full_filename)
        r=eng.griding2(full_filename,nargout=16)
        r=[round(float(x),2) for x in r]
    else:
        return "Please Upload File"
    return render_template('home.html', result=r) 

if __name__ == '__main__':
    app.run(debug=True)
    print("Starting matlab engine...")

