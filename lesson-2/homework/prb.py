import pyodbc

con_str = "DRIVER={SQL SERVER};SERVER=DESKTOP-8U1UKO5;DATABASE=master;Trusted_Connection=yes;"

con = pyodbc.connect(con_str)
cursor = con.cursor()

cursor.execute(
    """
    SELECT id, photo FROM photos;   
    """
)
row = cursor.fetchone()
img_id, name, image_data = row

with open(f'{name}.png', 'wb') as f:
    f.write(image_data)