# Apresentação dbt

Fonte dados: [Shopping Cart Database](https://www.kaggle.com/datasets/ruchi798/shopping-cart-database)


## 1. Criar & ativar ambiente virtual

- `python3 -m venv .venv`

- `source .venv/bin/activate`

## 2. Instalar dbt e dependências

`pip install -r requirements`


## 4. Criar o arquivo de profiles
`touch profiles.yml`

```
techstore:
  outputs:
    dev:
      type: postgres
      threads: 4
      host: localhost
      port: 5432
      user: postgres
      pass: postgres
      dbname: postgres
      schema: raw

  target: dev
```

## 5. Verificar se o dbt consegue se conectar com o banco de dados
`dbt debug`

## 6. Carregar seeds
`dbt seed`

## 7. Build

`dbt build`
