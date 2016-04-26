class Seeds

  def self.start
    new.generate
  end

  def generate
    create_users
    create_books
    create_ratings
  end

  def create_users
    User.create([
      {
        username: "Admin",
        password: "adminpassword",
        role: 1
      },
      {
        username: "admir",
        password: "password"
      }
      ])

  end

  def create_books
    Book.create([
      {
        title: "Hobbit",
        author: "JRR Tolken",
        image: "https://upload.wikimedia.org/wikipedia/en/3/30/Hobbit_cover.JPG"
      },
      {
        title: "A Brave New World",
        author: "Aldus Huxley",
        image: "http://ecx.images-amazon.com/images/I/41l%2B4UobkRL._SY344_BO1,204,203,200_.jpg"
      },
      {
        title: "1984",
        author: "George Orwell",
        image: "https://flavorwire.files.wordpress.com/2011/06/georgeorwellxobeygiantprintset-1984coverbyshepardfairey.jpeg"
      },
      {
        title: "Alice In Wonderland",
        author: "Lewis Carroll",
        image: "http://blogs.slj.com/afuse8production/files/2012/05/AliceWonderland2.1.jpg"
      },
      {
        title: "The Golden Compass",
        author: "Philip Pullman",
        image: "http://d.gr-assets.com/books/1451271747l/119322.jpg"
      }
      ])
  end

  def create_ratings
    Rating.create([
      {
        book_id: 1,
        score: 2
      },
      {
        book_id: 1,
        score: 3
      },
      {
        book_id: 1,
        score: 4
      },
      {
        book_id: 2,
        score: 5
      },
      {
        book_id: 2,
        score: 2
      },
      {
        book_id: 2,
        score: 1
      },
      {
        book_id: 2,
        score: 4
      },
      {
        book_id: 3,
        score: 2
      },
      {
        book_id: 3,
        score: 3
      },
      {
        book_id: 4,
        score: 3
      },
      {
        book_id: 4,
        score: 2
      },
      {
        book_id: 4,
        score: 3
      },
      {
        book_id: 4,
        score: 2
      },
      {
        book_id: 1,
        score: 2
      },
      {
        book_id: 5,
        score: 2
      },
      {
        book_id: 5,
        score: 2
      },
      {
        book_id: 5,
        score: 3
      },
      {
        book_id: 5,
        score: 4
      },
      {
        book_id: 5,
        score: 4
      }
      ])
  end
end


Seeds.start
