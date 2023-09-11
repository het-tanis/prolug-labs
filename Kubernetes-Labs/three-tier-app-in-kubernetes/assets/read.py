from flask import Flask, request, render_template
import pymysql
import os

db = pymysql.connect(host="mysql-service.data1.svc.cluster.local", user="root", password='Very$ecure1#', database="visitors")

app = Flask(__name__)
#api = Api(app)

@app.route('/')
def someName():
    cursor = db.cursor()
    sql = "SELECT * FROM persons"
    cursor.execute(sql)
    results = cursor.fetchall()
    return render_template('index.html', results=results)

if __name__ == '__main__':
          port = int(os.environ.get('PORT', 6000))
          app.run(debug=True, host='0.0.0.0', port=port)
          