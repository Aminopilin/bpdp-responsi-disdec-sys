from flask import Flask, jsonify
import psycopg2

app = Flask(__name__)

conn = psycopg2.connect(
    host="localhost",
    port="5433",
    database="responsi_db",
    user="yugabyte",
    password="yugabyte"
)

@app.route("/")

def home():
    return "REST API Yugabyte"

@app.route("/mahasiswa")

def mahasiswa():

    cur = conn.cursor()

    cur.execute("SELECT * FROM mahasiswa")

    rows = cur.fetchall()

    data=[]

    for r in rows:

        data.append({
            "id":r[0],
            "nama":r[1],
            "prodi":r[2]
        })

    cur.close()

    return jsonify(data)

@app.route("/matakuliah")

def mk():

    cur = conn.cursor()

    cur.execute("SELECT * FROM matakuliah")

    rows = cur.fetchall()

    data=[]

    for r in rows:

        data.append({
            "id":r[0],
            "nama_mk":r[1],
            "sks":r[2]
        })

    cur.close()

    return jsonify(data)

app.run(host="0.0.0.0",port=5000)