# Proof-of-concept geautomatiseerde data workflow

Deze repository hoort bij de cursus Linux in de professionele bacheloropleiding toegepaste informatica aan HOGENT. In deze repository vind je al de taak geautomatiseerde data workflow terug onder de folder 'data-workflow'

## Data

De data die verzameld wordt voor deze opdracht is Airbnb's in Gent. Specifiek wordt er gekeken naar: 'rating', 'price', 'reviewsCount', 'beds', 'bathrooms', 'bedrooms', 'isSuperhost'. Aan de hand van deze parameters worden er analyses gemaakt met pandas. [documentatie API](https://rapidapi.com/3b-data-3b-data-default/api/airbnb13)

## Periode

Het verzamelen van data gaat over een periode van 7 augustus 2023 tot en met 14 augustus 2023 om het uur.

## Handleiding

Het uitvoeren van de nodige scripts kunnen handmatig gebeuren maar zijn ook geautomatiseerd aan de hand van Github actions. De workflow wordt telkens uitgevoerd wanneer er nieuwe ruwe data json file wordt geupload naar 'data-workflow/ruwe-data/'.

### Scripts

1. ruwe_data.sh
   wordt gebruikt om het ophalen van de ruwe data aan de hand van een api-call

2. data_transform.sh
   Dit script gaat alle nodige parameters uit de ruwe data halen en deze opslaan in 'airbnb_data.csv'

3. airbnb_analysis.py
   In dit python script worden er analyses uitgevoerd op 'airbnb_data.csv'

4. generate_rapport.py
   Hierin wordt er een genereerde pdf bestand gemaakt met alle waarden uit de analyse. Dit zijnde de grafieken en de variabelen die de relaties beschrijven.

### Resultaat

[De genereerde pdf](data-workflow/rapport/generated_document.pdf) bevat de bevindingen over de data. Ook kan je het genereerde pdf bestand terug vinden op de Github pages van 'HoGentTIN'. (Er is geen mogelijkheid om dit te veranderen omdat de repository aangemaakt is door Github classrooms)
