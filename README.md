# BookACar Api

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 final_capstone_back_end ](#-final_capstone_back_end-)
  - [🛠 ER Diagram ](#-er-diagram-)
  - [💻 link to front end ](#-link-to-front-end-)
  - [💻 link to Kanban board information ](#-link-to-kanban-board-information-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Database Setup](#database-setup)
    - [Usage](#usage)
  - [💻 Tests ](#tests-)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ (OPTIONAL) ](#-faq-optional-)
  - [📝 License ](#-license-)

# 📖 BookACar Api <a name="about-project"></a>

**BookACar RESTful API** for the (BookACar)[https://github.com/fmanimashaun/book-a-car] reservation application, enabling car data management, reservations, and user authentication. Developed as the Microverse Full-Stack Web Development Capstone Project, demonstrating Ruby on Rails, React, database design, API development, and collaboration skills..

- [BookACar (Frontend) Kanban Board](https://github.com/users/fmanimashaun/projects/16)
- [BookACar Api (Backend) Kanban Board](https://github.com/users/fmanimashaun/projects/16/views/1)

**Team Members**

- [Anwar Hussaini](https://github.com/M-Anwar-Hussaini)
- [Esteban Palacios](https://github.com/Estete9)
- [Timothy Njoroge](https://github.com/simplegoose)
- [Tomas Esquivel](https://github.com/tomasesquivelgc)
- [Animashaun Fisayo Micahel](https://github.com/fmanimashaun)

**ER Diagram**
The API is designed as per the ER Diagram shown below which dictates the association of models and their relationships.

<img src="./ER Diagram.png">

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details> <summary>Programming Language</summary> <ul> <li>Ruby 3.2.2</li> </ul> </details>

<details> <summary>Web Application Framework</summary> <ul> <li>Rails 7.1.2</li> </ul> </details>

<details> <summary>Database</summary> <ul> <li>PostgreSQL (pg gem)</li> </ul> </details>

<details> <summary>Web Server</summary> <ul> <li>Puma</li> </ul> </details>

<details> <summary>Performance Optimization</summary> <ul> <li>Bootsnap</li> </ul> </details>

<details> <summary>Testing</summary> <ul> <li>Debug</li> <li>Factory Bot (factory_bot_rails gem)</li> <li>RSpec (rspec-rails gem)</li> <li>Capybara</li> <li>Selenium Webdriver</li> </ul> </details>

<details> <summary>Code Quality</summary> <ul> <li>Rubocop</li> </ul> </details>

<details> <summary>Development Tools</summary> <ul> <li>Web Console (web-console gem)</li> </ul> </details>

<details> <summary>Authentication</summary> <ul> <li>Devise (devise gem)</li> <li>Devise-jwt (devise-jwt gem)</li> </ul> </details>

<details> <summary>Authorization</summary> <ul> <li>CanCanCan (cancancan gem)</li> </ul> </details>

### Key Features <a name="key-features"></a>

- **Database Design:**
  - Schema: Design the entities (cars, reservations, users, roles) and their relationships.
  - Migrations: Create/modify database schema changes.
- **Models & Associations:**
  - Rails Models: Build Car, Reservation, User, and associated models.
  - Image Storage: Ensure robust integration with Active Storage for car image handling.
- **API Endpoints:**
  - CRUD for Cars: GET (fetch car lists, details), POST (admin adds car), DELETE (admin removes car).
  - Reservations: GET (user's reservations), POST (book a car).
  - Authentication: Login, signup (if supported), session management.
  - Authorization (CanCanCan): Define rules for admin-only actions.
- **API Documentation:** Maintain concise yet informative documentation

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps:

### Prerequisites

Before you begin, ensure you have the following prerequisites installed on your system:

- Ruby: You need Ruby to run the Ruby on Rails application.
- Bundler: Bundler is used to manage gem dependencies for your Ruby project.

### Setup

In your terminal, navigate to the folder of your choice and clone the repository with the following commands:

```sh
git clone https://github.com/EvansSnave/book-a-car-api.git

```

### Install

After cloning the project, change into the project directory:

```sh
cd cd book-a-car-api

bundle install

```

### Credentials setup

In order to create databases and run the tests, you need to follow this steps:

1. Remove config/master.key and config/credentials.yml.enc if they exist.
2. Run `rails secret`. This will generate a key. Copy and reserve the key to use later.
3. If you use Windows run: `$env:EDITOR="code --wait"; rails credentials:edit` If you use Linux run: `EDITOR="code --wait" bin/rails credentials:edit`
4. Your editor will open a file, add at the bottom `devise_jwt_secret_key: <the key you copied in step 2>`
5. Save the file and close the editor. New master.key, credentials.yml.enc files will be generated, and the key will be stored in `Rails.application.credentials.devise_jwt_secret_key`.

### Database Setup

This application uses PostgreSQL as the database. Here are the steps to set it up:

1. Ensure PostgreSQL is installed on your machine and running.

2. Update the config/database.yml file with your PostgreSQL username and password in the default section.

3. Create the database:

```bash
rails db:create
```

4. Run migrations to set up the database schema:

```bash
rails db:migrate
```

5. Load default date to database

```bash
rails db:seed
```

This should start your local server on http://localhost:4000/. Now, you can use the REST API client of your choice to interact with the API.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Tests <a name="tests"></a>

To run tests, navigate to the directory where the project is located on your machine, open your terminal, and follow these steps:

Test Suite
This project contains a suite of unit tests which you can run to ensure everything is functioning as expected. To run these tests, you need RSpec installed.

bundle exec rspec ./spec/controllers
bundle exec rspec ./spec/models

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Fisayo Michael Animashaun**

- GitHub: [@fmanimashaun](https://github.com/fmanimashaun)
- Twitter: [@fmanimashaun](https://twitter.com/fmanimashaun)
- LinkedIn: [Fisayo Michael Animashaun ](https://linkedin.com/in/fmanimashaun)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] Advanced Filtering/Search: Allow users to search/filter by:
  - [ ]Car make and model.
  - [ ]Specific dates with a visual calendar/picker.
  - [ ]Features/amenities (e.g., transmission type, seating capacity).
- [ ] User Profiles: Allow users to save preferences, view past reservations, and perhaps offer loyalty points/rewards.
- [ ] Reviews and Ratings: A simple system for users to rate cars or provide feedback on experiences.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/EvansSnave/book-a-car-api/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project please feel free to send us corrections for make it better we would feel glad to read your comments.
And think If you enjoy it gift us a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- Behance and Murat Korkmaz for the [original design](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign)
- Microverse for providing the opportunity to learn in a collaborative environment.
- GitHub for version control and collaboration tools.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ (OPTIONAL) <a name="faq"></a>

- **Can I use with a templeate your project?**

  - Of course we would feel honored.

- **Your project is free license?**

  - Yeah, you can use it completely.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is licensed under the MIT License - you can click here to have more details [MIT](./LICENSE).

<p align="right">(<a href="#readme-top">back to top</a>)</p>
