# UberPong

Die Idee ist, ein komplexes System wie Pong
in ein Gem zu verpacken und so von der Rails Kopplung
zu trennen.


Ziele

  - Oberste Ebene der Anwendung sollte komunizieren was sie kann
    Bspw. Module unter lib: billing/crm/ticket_system => offensichtlich
  - Niedrige Kopplung der Module untereinander durch Dependency Injection wo sinnvoll
  - Allgemein Best Practices
    - Single Responsibility Principle
    - Auf Boundaries achten
  - 100% Code Coverage
  - 100% TDD
  - Tests sollten auf jedenfall ohne Rails laufen


Offene Fragen

  - Persistenz Schnittstelle zu AR oder DM
    Wie genau an Rails bzw. beliebige Persistenzebene anbinden?