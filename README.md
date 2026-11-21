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
│   │   └── get_Z_spread.ipynb            # Calculates Z-spreads for Boeing's 2038 bond.
│   ├── aggregation/
│   │   └── agg_for_CG.ipynb              # Combines market and balance-sheet data and selects Boeing option-implied volatility.
│   ├── reports_data/
│   │   └── from_SEC.ipynb                # Extracts corporate debt data from SEC filings.
│   ├── risk_free_rates/
│   │   └── USA.ipynb                     # Downloads U.S. Treasury yield curve data from the Federal Reserve.
│   └── stock_data/
│       └── stocks.ipynb                  # Downloads Boeing stock prices and the S&P 500 Total Return Index.
├── Econometric_Models/
│   ├── Spread_regressions.ipynb          # Runs monthly regressions on changes in the Z-spread, model CDS spread, and their gap.
│   └── VECM.R                            # Tests cointegration and fits a VECM to market Z-spreads and model-implied CDS spreads.
├── Structure_models/
│   ├── Credit_Grades.ipynb               # Prices CDS spreads with CreditGrades using alternative equity volatility inputs.
│   ├── Merton.ipynb                      # Estimates Merton credit spreads using implied and GARCH volatility.
│   └── Merton_calibration.ipynb          # Infers bond spreads from option IV and equity volatility from market Z-spreads.
└── Vol_models/
    └── GARCH.ipynb                       # Forecasts stock return volatility with a GARCH model.
```
