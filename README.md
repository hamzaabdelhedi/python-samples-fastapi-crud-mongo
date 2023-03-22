<h1 align='center'> CRUD with Python, FastAPI and MongoDB </h1>


## Running the API

1. Create a virtual environment

```
python3 -m venv <name_of_venv>
```
2. Go to the virtual environment's directory and activate it

For Windows:
```
Scripts/activate
```
For Linux/Mac:
```
bin/activate
```
3. Install the requirements

```
pip install -r requirements.txt
```

4. Run the API with uvicorn

```
uvicorn main:app --reload --host "0.0.0.0"
```
