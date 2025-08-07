# Explorative Datenanalyse & Machine Learning – Use Case

**Projektart**: Abschlussprojekt / Use Case  
**Rolle**: Data Scientist (Trainee)  
**Tools**: Python, Pandas, scikit-learn, Jupyter Notebook  
**Zeitraum**: 2025  
**Kontext**: Durchführung einer vollständigen Analyse-Pipeline von Datenexploration über Feature Engineering bis zum ML-Modell

---

## 1. Zielsetzung

Ziel war es, ein strukturiertes Data-Science-Projekt umzusetzen – beginnend mit der Rohdatenerkundung über Feature Engineering und Modelltraining bis zur Evaluation eines Machine Learning-Modells. Der Fokus lag dabei auf Reproduzierbarkeit, modularer Struktur und nachvollziehbaren Ergebnissen.

---

## 2. Struktur & Methodik

Das Projekt wurde in vier Modulen strukturiert (einzusehen im Jupyter Notebook):

1. **Datenexploration**
   - Überblick über die Merkmale, Dimensionen, Datentypen
   - Erkennung von Ausreißern, fehlenden Werten, schiefen Verteilungen

2. **Feature Engineering**
   - Transformationen, Kategorisierung, Normalisierung
   - Auswahl relevanter Merkmale für das Modelltraining

3. **Modelltraining & Evaluation**
   - Training von Klassifikationsmodellen (z. B. RandomForest, Logistic Regression)
   - Einsatz von Pipelines & GridSearchCV zur Optimierung
   - Evaluation via Accuracy, Confusion Matrix, ROC-AUC

4. **Schlussfolgerung**
   - Bewertung der Modellgüte
   - Ideen für Verbesserung / Erweiterung

---

## 3. Highlights & Besonderheiten

- **Sauber dokumentiertes Jupyter Notebook** mit logisch gegliederter Struktur
- **Modularer Aufbau**: Ermöglicht Wiederverwendbarkeit einzelner Schritte
- **Praxisnaher Workflow**: Von Rohdaten bis Modellvergleich und Auswahl
- **Interpretation und Business-Fokus** an passenden Stellen

---

## Beispielhafte Vorschau (Notebook-Auszug)

> Das vollständige Notebook ist als `.ipynb` verfügbar und kann lokal oder über nbviewer geöffnet werden.

```python
# Beispiel: Klassifikation mit RandomForest
from sklearn.ensemble import RandomForestClassifier
model = RandomForestClassifier(random_state=42)
model.fit(X_train, y_train)
preds = model.predict(X_test)
```

---

## Learnings

- Die Bedeutung strukturierter Datenaufbereitung vor dem Modelltraining
- Modellvergleich und Tuning als iterative Prozesse
- Dokumentation und Visualisierung sind entscheidend für Nachvollziehbarkeit

---

## Tags

`DataScience` `MachineLearning` `JupyterNotebook` `Exploration` `FeatureEngineering` `ModelEvaluation`