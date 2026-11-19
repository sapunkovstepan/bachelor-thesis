My bachelor's thesis project at the Faculty of Economics, Lomonosov Moscow State University (MSU).

## Repository structure

```text
.
├── Data/
│   ├── Bonds/
│   │   └── Prepare_data.ipynb            # Loads and previews bond data from Investing.com.
│   ├── Options/
│   │   └── ThetaTernminal_parser.ipynb   # Downloads historical options data from Theta Terminal.
│   ├── Z_spreads/
│   │   ├── Untitled.ipynb                # Empty notebook.
│   │   └── get_Z_spread.ipynb            # Calculates Boeing bond Z-spreads.
│   ├── aggregation/
│   │   └── agg_for_CG.ipynb              # Combines market and financial data for credit models.
│   ├── reports_data/
│   │   └── from_SEC.ipynb                # Extracts corporate debt data from SEC filings.
│   ├── risk_free_rates/
│   │   └── USA.ipynb                     # Downloads U.S. Treasury yield curve data from the Federal Reserve.
│   └── stock_data/
│       └── stocks.ipynb                  # Downloads historical stock prices from Yahoo Finance.
├── Econometric_Models/
│   └── VECM.R                            # Tests cointegration and fits a VECM to bond Z-spreads and CDS spreads.
├── Structure_models/
│   ├── Credit_Grades.ipynb               # Estimates credit spreads with the CreditGrades model.
│   ├── Merton.ipynb                      # Estimates Merton credit spreads using implied and GARCH volatility.
│   └── Merton_calibration.ipynb          # Calibrates the Merton model to implied volatility and bond Z-spreads.
└── Vol_models/
    └── GARCH.ipynb                       # Forecasts stock return volatility with a GARCH model.
```
