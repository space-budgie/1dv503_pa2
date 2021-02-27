import csv

# https://stackoverflow.com/questions/7588934/how-to-delete-columns-in-a-csv-file
# Keep these columns from the detailed description of artworks (artworks_detailed.csv), and write the result to artworks.csv
columns_to_keep = ["Title", "Artist", "Date", "Medium", "Dimensions", "URL", "Circumference (cm)", "Depth (cm)", "Diameter (cm)", "Height (cm)", "Length (cm)", "Weight (kg)", "Width (cm)", "Seat Height (cm)", "Duration (sec.)"]

with open("artworks_original.csv", encoding="utf-8-sig") as f:
    original = list(csv.reader(f, delimiter=','))
    indexes_to_keep = [original[0].index(column) for column in columns_to_keep] 

    with open("artworks.csv", "w") as f2:
        write_file = csv.writer(f2)
        for row in original:
            if row:
                row_length = len(row)
                write_file.writerow( (row[i] for i in indexes_to_keep if i < row_length) )
