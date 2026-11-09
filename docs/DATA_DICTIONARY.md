# Data dictionary and model

| Table | Rows | Grain / key | Main fields |
|---|---:|---|---|
| `dim_pecas` | 100 | One part; `codigo_peca` | Name, category, criticality, base cost |
| `dim_fornecedores` | 10 | One supplier; `codigo_fornecedor` | Display name, state, contractual lead time |
| `fato_ofertas` | 394 | One part/supplier quote pair | Quote price, offered lead time, quote date |
| `fato_compras` | 2,500 | One order; `id_pedido` | Order/due/delivery dates, part/supplier keys, quantity, unit price, amount, delay days, defective units |
| `dim_calendario` | 638 | One date; `data` | Year, month, quarter and sorting attributes |

## Primary analytical fields

| Field | Meaning | Unit / convention |
|---|---|---|
| `valor_total` | Purchase line amount | BRL; equals quantity × unit price at cent precision |
| `preco_unitario` | Paid unit price | BRL per purchased unit |
| `preco_ofertado` | Quoted unit price | BRL per unit |
| `quantidade` | Purchased quantity | Units |
| `dias_atraso` | Nonnegative days after the expected delivery date | Days; zero denotes no delay |
| `unidades_defeituosas` | Defective purchased units | Count; cannot exceed quantity |
| `criticidade` | Assigned academic part criticality | High / Medium / Low |
| `data_cotacao` | Quote reference date | ISO date; September 30, 2026 |

CSV monetary fields use a decimal point, a comma field delimiter and no thousands separators. Dates use ISO-compatible strings. Business identifiers and Portuguese column names are preserved to match the supplied model; display values use the final English labels.

## Relationships verified in the PBIX

| Dimension key | Fact key | Cardinality | Direction |
|---|---|---|---|
| `dim_pecas[codigo_peca]` | `fato_compras[codigo_peca]` | 1 to many | Single |
| `dim_pecas[codigo_peca]` | `fato_ofertas[codigo_peca]` | 1 to many | Single |
| `dim_fornecedores[codigo_fornecedor]` | `fato_compras[codigo_fornecedor]` | 1 to many | Single |
| `dim_fornecedores[codigo_fornecedor]` | `fato_ofertas[codigo_fornecedor]` | 1 to many | Single |
| `dim_calendario[data]` | `fato_compras[data_pedido]` | 1 to many | Single |

The calendar covers the observed purchase-order dates, January 1, 2025 to September 30, 2026. It need not cover later due or delivery dates because its active analytical relationship uses order date.
