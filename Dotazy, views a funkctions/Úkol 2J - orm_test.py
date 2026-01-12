from sqlalchemy import create_engine, Column, Integer, String, Float
from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "postgresql://admin:admin@localhost:5432/film_database"

# Vytvoření motoru (engine) pro komunikaci s DB
engine = create_engine(DATABASE_URL)
# Základní třída pro ORM modely
Base = declarative_base()


class Film(Base):
    __tablename__ = 'films'
    
    
    film_id = Column(Integer, primary_key=True)
    title = Column(String)
    release_year = Column(Integer)
    rating = Column(Float)

    
    def __repr__(self):
        return f"<--Film(Název='{self.title}', Rok={self.release_year}, Hodnocení={self.rating})-->"

# 3. Vytvoření Session (relace pro komunikaci)
Session = sessionmaker(bind=engine)
session = Session()


print("------ Výpis všech Sci-Fi filmů ------")
sci_fi_movies = session.query(Film).filter(Film.rating > 8.0).limit(5).all()

for movie in sci_fi_movies:
    print(movie)
