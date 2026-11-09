# Analytical methodology

## Data lineage and grain

The starting academic notebook generates parts, suppliers, quotes and purchase orders with seed 42. The final Power BI file contains a corrected reporting snapshot, including monetary values and English display names. This portfolio uses that snapshot. Running the earlier generator yields R$146,268,297.01 of spend; the final model yields R$133,493,473.90. They must not be presented as identical versions.

The professional notebook reads the final five exported model tables and preserves their field names. One purchase record corresponds to one unique order identifier; one quote corresponds to a part/supplier pair. The model has shared part and supplier dimensions, with an order-date calendar related to purchases. Quotes are dated September 30, 2026.

## Indicator definitions

| Indicator | Definition |
|---|---|
| Total spend | Sum of `valor_total` |
| Order count | Distinct `id_pedido` |
| Units purchased | Sum of `quantidade` |
| Weighted unit price | Total spend / units purchased |
| Late-delivery rate | Orders with `dias_atraso > 0` / order count |
| Defect rate | Sum of defective units / sum of purchased units |
| Supplier coverage | Distinct suppliers quoting a given part |
| Low coverage | Quoted supplier count greater than zero and at most two |
| Relative quote gap | (Maximum quote - minimum quote) / maximum quote |
| High quote gap | Relative quote gap strictly greater than 0.30 |
| Part savings scenario | max(0, part spend - part quantity × minimum quote) |
| Total savings scenario | Sum of the part-level nonnegative savings |

The quote-gap denominator is the maximum quote, matching the final dashboard's `Diferença Relativa entre Ofertas` measure. The original notebook uses the minimum quote in a different dispersion calculation. The final dashboard definition is used consistently here. The original query's signed net savings is retained separately for analytical comparison; it is not the dashboard total.

## Purchasing scenarios

Savings compare historical purchasing quantities with the lowest quote in the retained snapshot. Applying a September 2026 quote across the whole historical period is an analytical benchmark, not a historically available purchasing plan. This scenario excludes freight, tax differences, capacity constraints, minimum lots, contract terms, switching costs and qualification costs. A positive result identifies an opportunity for investigation, not a realized reduction in expenditure.

## Priority matrix

The spend threshold is the arithmetic mean of positive part spending in the current scope. At full scope it is R$1,334,934.739. The quote-gap threshold is 30%.

| Segment | Spend condition | Gap condition | Full-scope count | Interpretation |
|---|---|---|---:|---|
| Q1 - Prioritize | Above mean | >30% | 9 | High-impact negotiation candidates |
| Q2 - Negotiate | At or below mean | >30% | 21 | Targeted negotiation candidates |
| Q3 - Maintain | At or below mean | ≤30% | 46 | Monitor current terms |
| Q4 - Optimize | Above mean | ≤30% | 24 | Review volume and contracts |

The notebook reproduces the unfiltered scope. Power BI recalculates the mean using `ALLSELECTED`; filtered results need to be interpreted in their corresponding context.

## Supplementary supplier score

The original notebook defines a 0-100 weighted score: 30% cost proxy, 30% punctuality, 25% quality and 15% coverage. Indicators use min-max scaling; lower delay, defect rate and average order spend are preferred, while wider purchased-part coverage is preferred.

The cost proxy is spend per order, not a like-for-like unit-price index. It is affected by purchase volume and product mix. The score is reproduced as a supplementary exploratory output on the final inputs, with the original weights. It does not establish a universally superior supplier and is not represented as a score displayed in the supplied dashboard. Atlas Components' favorable delivery/quality profile is distinct from the weighted composite ranking.

## Action estimates and presentation scope

The dashboard action table applies fixed coefficients of 0.53, 0.32, 0.20, 0.19, 0.15, 0.10, 0.08, 0.06, 0.04 and 0.03 to total potential savings. These are illustrative action estimates. They overlap, are not separately validated business benefits, and must not be added together.

The original action list mentions prioritizing Fastening; the verified largest savings category is Safety. This portfolio highlights Safety for its quantified opportunity while preserving the supplied report as evidence of the existing deliverable.

The case demonstrates analytical methods using synthetic observations. It makes no claim of actual company performance, achieved procurement savings or audited commercial transactions.
