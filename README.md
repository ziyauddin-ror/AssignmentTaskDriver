**Note:-**

In PurchaseFuel Model payment_type value is enum
0 = paylater, 
1 = card_type,
2 = bank_account

**DataBase Modeling Diagram**

For ERdiagram I have use gem 'rails-erd'

[erd.pdf](https://github.com/ziyauddin-ror/AssignmentTaskDriver/files/9555262/erd.pdf)

## Installation

### Clone the repository

```bash
https://github.com/ziyauddin-ror/AssignmentTaskDriver.git
cd AssignmentTaskDriver

```

### Ruby version
`ruby 3.1.2` require

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```bash
bundle install
```

### Update database.yml file
In database.yml file, edit the database configuration as required.

### Initialize the database

```ruby
rake db:create db:migrate
```

### Serve

```ruby
rails s
```
And now you can visit the site with the URL http://localhost:3000/api-docs/index.html

### Spec Info
if you create changes in spec folder
run below command

```bash
rake rswag:specs:swaggerize 
```
