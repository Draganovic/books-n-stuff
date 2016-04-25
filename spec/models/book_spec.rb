require 'rails_helper'

RSpec.describe Book, type: :model do
  context "derived attribute" do
    describe '#average_rating' do
      it "has an average_rating" do
        book = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

        rating3 = Rating.create!(score: 3, book_id: book.id)
        rating1 = Rating.create!(score: 2, book_id: book.id)
        rating2 = Rating.create!(score: 4, book_id: book.id)

        expect(book.average_rating).to be 3.0
      end

      it "rounds to the nearest 10th when average becomes a float" do
        book = Book.create!(title: "The Hobbit", author: "JRR Tolkin", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

        rating1 = Rating.create!(score: 2, book_id: book.id)
        rating2 = Rating.create!(score: 2, book_id: book.id)
        rating3 = Rating.create!(score: 3, book_id: book.id)

        expect(book.average_rating).to be 2.3
      end

      it "displays books in order" do
        book1 = Book.create!(title: "c", author: "c author", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")
        book2 = Book.create!(title: "a", author: "a author", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")
        book3 = Book.create!(title: "b", author: "b author", image: "http://vignette3.wikia.nocookie.net/lotr/images/b/b8/Hobbit-cover.jpg/revision/latest?cb=20070706183816")

        expect(Book.alphabetize).to eq [book2, book3, book1]
      end
    end
  end
end
