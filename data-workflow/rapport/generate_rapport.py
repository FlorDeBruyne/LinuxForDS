import datetime
import json
import pypandoc

pypandoc.download_pandoc()

# Stap 1: Lees de analysis waarden in
with open("data-workflow/analysis/analysis_values.json", "r") as json_file:
    analysis_values = json.load(json_file)
    
# Stap 2: Lees het Markdown-sjabloon in
with open("data-workflow/rapport/documentsjabloon.md", "r") as template_file:
    markdown_template = template_file.read()

# Stap 3: Genereer een timestamp
timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# Vervang de plaatshouders in het sjabloon
markdown_content = markdown_template.replace("{{TIMESTAMP}}", timestamp)
markdown_content = markdown_content.replace("{{cor_rating}}", str(analysis_values["rating_price"]))
markdown_content = markdown_content.replace("{{cor_review}}", str(analysis_values["review_price"]))
markdown_content = markdown_content.replace("{{cor_beds}}", str(analysis_values["beds_price"]))
markdown_content = markdown_content.replace("{{cor_bathrooms}}", str(analysis_values["bathrooms_price"]))
markdown_content = markdown_content.replace("{{cor_bedrooms}}", str(analysis_values["bedrooms_price"]))
markdown_content = markdown_content.replace("{{superhost_ttest}}", str(analysis_values["superhost_price"]))

# Stap 4: Sla het gegenereerde pdf-bestand op
pdf_output_filename = "data-workflow/rapport/generated_rapport.pdf"
pypandoc.convert_text(markdown_content, "pdf", format="md", outputfile=pdf_output_filename)

print(f"Document '{pdf_output_filename}' has been generated.")