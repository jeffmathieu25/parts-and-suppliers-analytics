# Parts and Suppliers

### Procurement costs, supplier performance and purchasing opportunities

**SQL · Python · Pandas · NumPy · SQLite · Power BI · DAX**

A collaborative academic analytics project combining procurement data, supplier performance indicators and visual reporting to support purchasing decisions.

![Executive purchasing overview](assets/01_executive_overview.png)

## Project overview

Procurement decisions require a balanced understanding of cost, delivery reliability, product quality and supplier availability. This project integrates these dimensions into an analytical workflow that identifies spending patterns, purchasing opportunities and areas requiring closer supplier management.

Developed as a collaborative academic project for **TOTI · Class 59 · Group 05**, the analysis uses a **synthetic procurement dataset** comprising 100 parts across eight categories, 10 suppliers, 394 supplier quotes and 2,500 purchase orders covering January 2025 through September 2026.

## Business questions

- How does purchasing expenditure evolve over time?
- Which parts, categories and suppliers account for the largest spending shares?
- How do suppliers compare in delivery reliability and product quality?
- Which parts show the largest relative differences between supplier quotes?
- Where do quote-based comparisons suggest potential savings?
- Which parts have limited supplier coverage?
- Which purchasing opportunities should receive priority?

## Scope and key results

The following indicators summarize the complete analysis period:

| Indicator | Result |
|---|---:|
| Order-date coverage | January 1, 2025 - September 30, 2026 |
| Purchase orders | 2,500 |
| Units purchased | 636,430 |
| Parts | 100 |
| Categories | 8 |
| Suppliers | 10 |
| Supplier quotes | 394 |
| Total spend | R$133,493,473.90 |
| Quantity-weighted unit price | R$209.75 |
| Late-delivery rate | 47.40% of orders |
| Defect rate | 1.81% of purchased units |
| Parts with two or fewer quoted suppliers | 25 |
| Parts with relative quote gaps above 30% | 30 |
| Potential savings scenario | R$36,261,805.79 |
| Potential savings as a share of spend | 27.16% |

Potential savings represent a quote-based analytical scenario rather than realized financial gains. The calculation sums nonnegative savings at part level. Indicator definitions are documented in [Methodology](docs/METHODOLOGY.md).

## Analytical methodology

The project combines structured data preparation, relational analysis, Python calculations and Power BI reporting.

1. **Data organization:** part, supplier, quotation, purchase-order and calendar tables establish the relational structure of the analysis.

2. **Data preparation and validation:** Pandas assigns appropriate numeric and date types. Validation checks assess missing values, duplicate identifiers, key relationships, valid prices and quantities, delivery-date consistency and purchase amount calculations.

3. **SQL analysis:** SQLite queries calculate purchasing totals, monthly spending, category contributions, supplier performance, quote dispersion and supplier coverage.

4. **Indicator development:** Pandas and NumPy calculate part-level savings scenarios, purchasing priority groups and a supplementary weighted supplier score based on cost, punctuality, quality and coverage.

5. **Visualization and interpretation:** charts and analytical summaries connect the calculated indicators to procurement questions. SQL and Pandas totals are compared to verify computational consistency.

6. **Power BI reporting:** DAX measures and four report pages communicate the findings through executive, supplier, part-level and action-planning perspectives.

The notebook documents the purpose of each analytical stage, the calculation methods and the interpretation of the results.

## Findings and business interpretation

- **Spending concentration:** Fastening accounts for 20.26% of total spend. Boreal Supplies is the largest supplier by expenditure, representing 12.98%.

- **Purchasing opportunities:** Safety has the largest category-level potential savings scenario, at R$8,974,791.39. Industrial Lock 093 leads individual parts, at R$5,583,047.48.

- **Supplier coverage:** 25 parts have two or fewer quoted suppliers, identifying items for further assessment of sourcing alternatives and supply continuity.

- **Delivery reliability:** Delta Parts has the highest late-delivery rate, at 51.90%. Atlas Components has the lowest rate, at 39.59%.

- **Product quality:** Phoenix Materials has the highest defect rate, approximately 3.20%. Atlas Components combines its comparatively favorable delivery performance with a defect rate of approximately 0.82%.

- **Purchasing priorities:** the combination of spending and relative quote gaps separates parts into four action groups.

### Purchasing priority groups

| Group | Spending profile | Relative quote gap | Parts | Decision focus |
|---|---|---|---:|---|
| Q1 — Prioritize | Above mean part spend | Above 30% | 9 | Prioritize negotiation assessment |
| Q2 — Negotiate | At or below mean part spend | Above 30% | 21 | Target focused negotiation opportunities |
| Q3 — Maintain | At or below mean part spend | At or below 30% | 46 | Monitor prices and current terms |
| Q4 — Optimize | Above mean part spend | At or below 30% | 24 | Review volume discounts and contracts |

The spending threshold is the mean expenditure among parts with positive spending in the selected scope. Relative quote gaps are calculated as the difference between the highest and lowest quote divided by the highest quote.

## Power BI report

The report presents four complementary analytical perspectives:

| Page | Analytical purpose | Preview |
|---|---|---|
| Executive Overview | Purchasing totals, monthly trends and spending concentration | [View](assets/01_executive_overview.png) |
| Supplier Performance | Delivery reliability, defect rates and purchased-part coverage | [View](assets/02_supplier_performance.png) |
| Parts Analysis | Part spending, quote-based opportunities and supplier dependency | [View](assets/03_parts_analysis.png) |
| Recommendations and Conclusions | Purchasing priority groups and action planning | [View](assets/04_recommendations.png) |

[View the four-page report PDF](powerbi/Parts_and_Suppliers_Report.pdf)

The PDF and page previews provide a static view of the report. Interactive filtering requires access to the Power BI report.

**Reading note:** delay ratios displayed as decimals, such as 0.47, correspond to approximately 47%. On the Supplier Performance page, the horizontal bars represent distinct parts purchased from each supplier; the monetary spending figures appear in the supplier table.

## Repository contents

| Resource | Description |
|---|---|
| [Analysis notebook](notebooks/Parts_and_Suppliers_Analysis.ipynb) | Python and SQL workflow with analytical explanations and aggregate outputs |
| [SQL queries](sql/analysis.sql) | Relational queries supporting the procurement analysis |
| [Core DAX measures](powerbi/core_measures.dax) | Reporting indicators and their measure dependencies |
| [Methodology](docs/METHODOLOGY.md) | Calculation rules, assumptions and interpretation |
| [Data dictionary](docs/DATA_DICTIONARY.md) | Table structure, analytical fields and relationships |
| [Data and indicator validation](docs/VALIDATION.md) | Integrity checks and indicator verification |
| [Reproducibility](docs/REPRODUCIBILITY.md) | Execution environment and input requirements |
| [Team credits](docs/CREDITS.md) | Collaborative project attribution |
| [Data access statement](docs/DATA_ACCESS.md) | Conditions governing access to project inputs |

## Data source and access

The project uses synthetic procurement data developed for academic analysis. Five related tables describe parts, suppliers, quotations, purchase orders and calendar dates. These tables support the SQL, Python and Power BI analyses.

The public portfolio includes analytical code, documentation, aggregate outputs and static report views. Record-level inputs and the editable Power BI file are not publicly distributed.

Access to the input data may be considered upon request, subject to the project team's agreement. Rerunning the notebook requires the input files and the environment described in [Reproducibility](docs/REPRODUCIBILITY.md).

## Interpretation and limitations

The dataset supports the demonstration of analytical methods and does not represent an actual company's procurement operations.

Potential savings compare historical purchasing quantities with the lowest quote available for each part in the September 2026 quote table. This benchmark does not establish that those quotes were available when each historical order was placed.

Purchasing decisions also require consideration of freight, taxes, contractual conditions, supplier capacity, minimum order quantities, qualification requirements and switching costs.

The supplementary supplier score depends on its selected indicators and weights. Its cost component uses average order spend, which is influenced by order size and product mix. The score complements the separate performance indicators.

Action-impact estimates in the report are illustrative, may overlap and should not be added together as independent financial benefits.

## Project team

A collaborative academic project developed for **TOTI · Class 59 · Group 05** by:

- **Jeff-Mathieu Saint-Amour**
- **Samuel Owens Fumero Fuentes**
- **Gabriel Enrique Marcano López**

Presented in the data analytics portfolio of:

**Jeff-Mathieu Saint-Amour · Data Analyst · Civil Engineer · PhD Student in Production Engineering**

## Project presentation

![Team presentation cover](assets/original_presentation_cover.png)

Presentation cover for the TOTI Class 59, Group 05 collaborative project.

## Skills demonstrated

- Relational data organization and modeling
- SQL joins, aggregations and common table expressions
- Data quality validation with Pandas
- Numerical analysis with NumPy
- Procurement and supplier performance indicators
- Weighted scoring and purchasing prioritization
- DAX measures and Power BI reporting
- Analytical visualization and business interpretation
- Collaborative project documentation

## Use of project materials

This repository presents collaborative academic work for portfolio purposes. Redistribution or reuse of project materials remains subject to the rights and permissions of the relevant contributors.
