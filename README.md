# UberPong

Die Idee ist, ein komplexes System wie Pong in ein Gem zu verpacken und so von der Rails Kopplung zu trennen.


# Ziele

- Oberste Ebene der Anwendung sollte komunizieren was sie kann
  Bspw. Module unter lib: billing/crm/ticket_system => offensichtlich
- Niedrige Kopplung der Module untereinander durch Dependency Injection wo sinnvoll
- Allgemein Best Practices
  - Single Responsibility Principle
  - Tell dont Ask
  - Auf Boundaries achten
- Code Coverage im Auge behalten
- TDD
- Tests sollten auf jedenfall ohne Rails laufen


# Offene Fragen

- Persistenz Schnittstelle zu AR oder DM
  Wie genau an Rails bzw. beliebige Persistenzebene anbinden? Je nach Anwendungsfall bedarf es viel Arbeit die Trennung dauerhaft aufrecht zu halten. Ist bei kleineren Projekten vermutlich nicht den Mehraufwand Wert.

# Benutze Gems

- [Virtus](https://github.com/solnic/virtus) - Bietet Syntax für typisierte Attribute, default Werte etc.
- [rspec](http://rspec.info/) - Für Tests
- [rspec-fire](https://github.com/xaviershay/rspec-fire) - Sichereres Mocken, siehe Erkenntnisse
- [Perpetuity](https://github.com/jgaskins/perpetuity) - MongoDB Datenbank Gem mit Datamapper Pattern






# Erkenntnisse

## Integrations-Tests

Outer Boundaries (Services) sollten Unit getestet werden zur Funktionalitätssicherung und Designkontrolle, __aber auf jedenfall auch Integration__. Da Bspw. Services am ehesten Mocks benutzen, muss sichergestellt werden das auf echter Datenbasis alles funktioniert. Schnittstellen sind sonst nicht sichergestellt.

    it "should rate a customer" do
      c = double('Customer', {total_payed: 100})

      c.should_receive(:rating=).with(1)
      RateCustomers.run!(customers: [c])
    end

Dieser Test läuft wunderbar durch obwohl Customer keine total_payed Methode mehr hatte. => Wichtiger Grund zu für Integrationstests.

### Zusatz

Als zusätzliche Sicherung kann [rspec-fire](https://github.com/xaviershay/rspec-fire) genutzt werden. Dies stellt sicher, dass die gemockte Klasse die aufgerufenen Funktionen auch bereitstellt sofern sie geladen ist.

## expect{}.to raise_error

Grundsätzlich eigene Fehlerklassen definieren. Sonst kann es schnell passieren das man den Falschen (nicht erwarteten, zb. NoMethod) Fehler fängt.

    expect {
      customer.contact_for_role(:something)
    }.to raise_error(Customer::RoleNotFound)

## RSpec vs Minitest

- Minitest hat eine spec-syntax, ähnlich der von RSpec. Mir persönlich gefällt _foo.must_equal bar_ besser als _foo.should == bar_ oder _expect(foo).to eq bar_.
- Minitest soll angeblich auch deutlich schneller sein als RSpec, allerdings hat sich das inzwischen stark ausgeglichen und der Vorteil ist minimal.
- RSpec hat deutlich bessere Community unterstützung und ist aktuell der quasi Standard.
- Der RSpec Formatter ist deutlich besser als die verfügbaren für Minitest.
- Angeblicher Vorteil von MiniTest ist, dass es mit Ruby ausgeliefert wird. Dieser verschwindet aber direkt wieder wenn klar wird das man das Gem trotzdem nutzen muss um die vollständigere Version zu nutzen.
- Es gibt MiniTest::Mock aber keine Stubs und MiniTest::Mock ist nicht annähernd so vollständig wie von RSpec, daher kommt man um ein Mock Gem wie mocha nicht drumherum.

Schlussfolgerung: Minitest ist interessant aufgrund dem minimalen und zusammsteckbaren Ansatz, RSpec ist aber defakto weiter verbreitet und erschöpfender, daher vermutlich im produktiv Ansatz vorerst das Mittel der Wahl.

## Perpetuity

Perpetuity ist ein Datamapper Pattern Gem für MongoDB.

Ist definitiv noch nicht Reif für den Produktiv Einsatz bzw. erfordert Zusammenarbeit mit dem Gem hersteller. Es gibt aktuell auch nur einen  MongoDB Adapter. Theoretisch ließe sich auch ActiveRecord nutzen sofern man eine klare Trennlinie zwischen Datenbank und Model/Entity zieht. Problem ist die nicht automatische Befüllung der POROs. Da müsste dann Arbeit erfolgen, sofern man dem Repository/Datamapper Pattern folgen will.