# Validation and reconciliation

The delivered professional notebook was executed from start to finish against the final PBIX tables. All 20 integrity checks and 14 final-snapshot reconciliation checks passed. SQL and Pandas spending totals agree to cent precision.

## Data integrity

```csv
Check,Issues
Duplicate part keys,0
Duplicate supplier keys,0
Duplicate order IDs,0
Duplicate quote pairs,0
Duplicate calendar dates,0
Missing values,0
Invalid purchase prices,0
Invalid quote prices,0
Invalid quantities,0
Invalid defect counts,0
Invalid delay values,0
Orphan purchase part keys,0
Orphan purchase supplier keys,0
Orphan quote part keys,0
Orphan quote supplier keys,0
Parts without quotes,0
Orders outside calendar,0
Delivery before order,0
Inconsistent delay days,0
Inconsistent line amounts,0
```

## Final reporting snapshot

```csv
Metric,Calculated,Expected,Pass
Total spend,133493473.90,133493473.9,True
Orders,2500.0,2500.0,True
Units,636430.0,636430.0,True
Parts,100.0,100.0,True
Suppliers,10.0,10.0,True
Quotes,394.0,394.0,True
Late-delivery rate,0.474,0.474,True
Potential savings,36261805.79,36261805.79,True
Low-coverage parts,25.0,25.0,True
High quote-gap parts,30.0,30.0,True
Q1 - Prioritize,9.0,9.0,True
Q2 - Negotiate,21.0,21.0,True
Q3 - Maintain,46.0,46.0,True
Q4 - Optimize,24.0,24.0,True
```

The 20 integrity checks cover uniqueness, missing values, positive prices and quantities, valid defects and delays, relational keys, calendar coverage, date ordering and line amount arithmetic. The report checks cover the complete unfiltered snapshot. They do not claim verification of all interactive report states or the independent business validity of synthetic data.

The supplied PDF rounds total spend to R$133 million and quantities to 636 thousand. Its detailed table rounds spend to whole BRL. The exact model sum is R$133,493,473.90 and the exact quantity is 636,430.
