# Reproducibility

The notebook is compatible with Google Colab and a standard Python environment. Dependencies are NumPy, Pandas, Matplotlib and the Python standard-library SQLite module. Package versions used for the delivered execution are recorded in its first output.

The input path is read from the `PARTS_SUPPLIERS_DATA_DIR` environment variable. Its default is `/content/parts_suppliers_inputs`. The approved input directory contains `dim_pecas.csv`, `dim_fornecedores.csv`, `dim_calendario.csv`, `fato_ofertas.csv` and `fato_compras.csv`. These files are supplied separately to the project owner and are excluded from the public repository.

The output path is read from `PARTS_SUPPLIERS_OUTPUT_DIR`, default `/content/parts_suppliers_outputs`. The SQLite database and analytical CSV exports are written there. The pipeline fails on missing files or failed validation rather than substituting generated records. No browser download or network connection is triggered by the notebook.

The delivered notebook has been executed on the approved inputs extracted from the final PBIX. Stored outputs show aggregate results. The SQL file contains equivalent standalone analytical SELECT queries over the four main SQLite tables. DAX expressions in `powerbi/core_measures.dax` are transcribed from the supplied model and refer to that model's names.

The four report screenshots and PDF are static evidence. They do not prove every interactive filter combination was tested. The PBIX remains an external, controlled source and is not included in the public archive.
