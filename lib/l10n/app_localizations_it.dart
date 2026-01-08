// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get previewDescription =>
      'Anteprima della tua analisi del tema natale';

  @override
  String get fullPersonalityAnalysis => 'Analisi completa della personalità';

  @override
  String get detailedPlanetaryInterpretation =>
      'Interpretazione planetaria dettagliata';

  @override
  String get personalizedInsights => 'Intuizioni personalizzate';

  @override
  String get getFullReading => 'Ottieni lettura completa';

  @override
  String get generating => 'Generando...';

  @override
  String get generatingReading => 'Generazione lettura...';

  @override
  String get compatibilityAnalysis => 'Analisi di Compatibilità';

  @override
  String generateDetailedCompatibilityAnalysis(Object relationshipTitle) {
    return 'Genera un\'analisi dettagliata della compatibilità tra $relationshipTitle';
  }

  @override
  String get generateAnalysis => 'Genera Analisi';

  @override
  String get errorTitle => 'Errore';

  @override
  String generatingTopic(Object topic) {
    return 'Generando: $topic...';
  }

  @override
  String get synastry => 'Sinastria';

  @override
  String get personA => 'Persona A';

  @override
  String get personB => 'Persona B';

  @override
  String synastryBetween(Object person1, Object person2) {
    return 'Sinastria tra $person1 e $person2';
  }

  @override
  String birthChartOf(Object name) {
    return 'Tema natale di $name';
  }

  @override
  String get preparingReading => 'Preparazione lettura...';

  @override
  String get loadingImage => 'Caricamento immagine...';

  @override
  String get read => 'Leggi';

  @override
  String get logoutSuccessful => 'Logout effettuato con successo';

  @override
  String get appTitle => 'AstroGods';

  @override
  String get homeTitle => 'Home';

  @override
  String get personalityTitle => 'Personalità';

  @override
  String get relationshipsTitle => 'Relazioni';

  @override
  String get predictionsTitle => 'Previsioni';

  @override
  String get dailyPredictionsTitle => 'Previsioni del giorno';

  @override
  String get monthlyPredictionsTitle => 'Previsioni del mese';

  @override
  String get codexTitle => 'Codex';

  @override
  String get savedChartsTitle => 'Analisi salvate';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get language => 'Lingua';

  @override
  String get english => 'Inglese';

  @override
  String get italian => 'Italiano';

  @override
  String get theme => 'Tema';

  @override
  String get lightMode => 'Chiaro';

  @override
  String get darkMode => 'Scuro';

  @override
  String get systemMode => 'Sistema';

  @override
  String get unveilHeart =>
      'Scopri il cuore di una persona attraverso il suo tema di nascita';

  @override
  String get firstName => 'Nome';

  @override
  String get lastName => 'Cognome';

  @override
  String get birthPlace => 'Luogo di nascita';

  @override
  String get birthDate => 'data di nascita';

  @override
  String get birthTime => 'ora di nascita';

  @override
  String get dontKnowBirthTime => 'Non conosco l\'ora di nascita';

  @override
  String get withoutBirthTimeWarning =>
      'Senza l\'ora di nascita la lettura non prenderà in considerazione l\'Ascendente';

  @override
  String get getStarted => 'INIZIA';

  @override
  String get subtitlePart1 => 'Allineati';

  @override
  String get subtitlePart2 => 'al tuo';

  @override
  String get subtitlePart3 => 'cielo';

  @override
  String get birthChartReading => 'Lettura del tema natale';

  @override
  String birthChartFor(Object name) {
    return 'Tema natale di $name';
  }

  @override
  String place(Object place) {
    return 'Luogo: $place';
  }

  @override
  String get at => 'alle';

  @override
  String errorLoadingChart(Object error) {
    return 'Errore caricando il grafico: $error';
  }

  @override
  String get chartNotAvailable => 'Grafico non disponibile.';

  @override
  String get readingGeneratedSuccessfully => 'Lettura generata con successo!';

  @override
  String get subscriptionRequiredMessage =>
      'È necessario un abbonamento attivo per generare letture dopo la prima lettura gratuita. Iscriviti per continuare a esplorare altri temi natali.';

  @override
  String get discoverHeartOfRelationship =>
      'Scopri il cuore di una relazione attraverso la sua sinastria';

  @override
  String get birthChartsMustBeDifferent =>
      'I due temi natali devono essere diversi';

  @override
  String get errorLoadingSavedCharts => 'Errore caricando le analisi salvate';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get noSavedBirthCharts => 'Nessun tema natale salvato';

  @override
  String get needTwoBirthChartsForSynastry =>
      'Per creare una sinastria hai bisogno di almeno due temi natali salvati.';

  @override
  String get oneMoreChartNeeded =>
      'Hai già un tema. Creane un secondo per la sinastria';

  @override
  String get needBirthChartForPredictions =>
      'Per le previsioni ti serve prima un tema natale';

  @override
  String get createBirthChart => 'Crea tema natale';

  @override
  String get createFirstChart => 'Crea il primo tema';

  @override
  String get createSecondChart => 'Crea il secondo tema';

  @override
  String get searchBirthCharts => 'Cerca temi natali...';

  @override
  String get searchByNameOrPlace => 'Cerca per nome o luogo';

  @override
  String get selectFirstBirthChart => 'Seleziona il primo tema natale';

  @override
  String get selectSecondBirthChart => 'Seleziona il secondo tema natale';

  @override
  String get creating => 'Creazione in corso...';

  @override
  String get createSynastry => 'Crea sinastria';

  @override
  String get synastryDescription =>
      'La sinastria è l\'arte di confrontare due temi natali per comprendere le dinamiche di una relazione.';

  @override
  String get transitDescription =>
      'I transiti sono i movimenti dei pianeti che, passando sulle posizioni del cielo natale, attivano influenze astrologiche temporanee.';

  @override
  String get birthChartDescription =>
      'Il tema natale è la raffigurazione simbolica delle posizioni dei corpi celesti al momento della nascita.';

  @override
  String get viewPlans => 'Visualizza piani';

  @override
  String get cancel => 'Annulla';

  @override
  String get pleaseSelectBirthPlace => 'Seleziona un luogo di nascita';

  @override
  String get searching => 'Cercando...';

  @override
  String get searchInProgress => 'Ricerca in corso...';

  @override
  String get noResultsFound => 'Nessun risultato trovato';

  @override
  String forSearchTerm(Object term) {
    return 'per \"$term\"';
  }

  @override
  String get login => 'Accedi';

  @override
  String get register => 'Registrati';

  @override
  String get email => 'email';

  @override
  String get password => 'password';

  @override
  String get confirmPassword => 'Conferma password';

  @override
  String get forgotPassword => 'Password dimenticata?';

  @override
  String get resetPassword => 'Reimposta password';

  @override
  String get resetPasswordTitle => 'Reimposta la tua password';

  @override
  String get sendResetLink => 'Invia link di reset';

  @override
  String get backToLogin => 'Torna al login';

  @override
  String get checkYourEmail => 'Controlla la tua email';

  @override
  String resetLinkSent(Object email) {
    return 'Abbiamo inviato un link per reimpostare la password a $email';
  }

  @override
  String get didntReceiveEmail => 'Non hai ricevuto l\'email?';

  @override
  String get checkSpamFolder =>
      'Controlla anche la cartella spam o posta indesiderata';

  @override
  String get resendEmail => 'Reinvia email';

  @override
  String get enterNewPassword => 'Inserisci la nuova password';

  @override
  String get newPassword => 'Nuova password';

  @override
  String get confirmNewPassword => 'Conferma nuova password';

  @override
  String get passwordResetSuccessful => 'Password reimpostata con successo';

  @override
  String get invalidResetToken => 'Token di reset non valido o scaduto';

  @override
  String get emailSentSuccessfully => 'Email inviata con successo';

  @override
  String get dontHaveAccount => 'Non hai un account?';

  @override
  String get alreadyHaveAccount => 'Hai già un account?';

  @override
  String get signUp => 'Registrati';

  @override
  String get signIn => 'Accedi';

  @override
  String get logout => 'Esci';

  @override
  String get profile => 'Profilo';

  @override
  String get welcomeBack => 'Bentornato!';

  @override
  String get createAccount => 'Crea il tuo account';

  @override
  String get loginToAccount => 'Accedi al tuo account';

  @override
  String get pleaseFillAllFields => 'Compila tutti i campi obbligatori';

  @override
  String get passwordsDoNotMatch => 'Le password non corrispondono';

  @override
  String get invalidEmail => 'Inserisci un indirizzo email valido';

  @override
  String get passwordTooShort =>
      'La password deve essere lunga almeno 8 caratteri';

  @override
  String get loginSuccessful => 'Accesso effettuato con successo!';

  @override
  String get registrationSuccessful => 'Registrazione completata con successo!';

  @override
  String get personalInfo => 'Informazioni Personali';

  @override
  String get birthInfo => 'Informazioni di Nascita';

  @override
  String get next => 'Avanti';

  @override
  String get previous => 'Indietro';

  @override
  String get finish => 'Termina';

  @override
  String get emailAlreadyExists => 'Questo indirizzo email è già registrato';

  @override
  String get goToLogin => 'Accedi';

  @override
  String get chartsCountSingular => '1 analisi salvata';

  @override
  String chartsCountPlural(Object count) {
    return '$count analisi salvate';
  }

  @override
  String get birthChartsCountSingular => '1 tema natale salvato';

  @override
  String birthChartsCountPlural(Object count) {
    return '$count temi natali salvati';
  }

  @override
  String get synastriesCountSingular => '1 sinastria salvata';

  @override
  String synastriesCountPlural(Object count) {
    return '$count sinastrie salvate';
  }

  @override
  String get chartRemovedFromSaved => 'Tema natale rimosso dai salvati';

  @override
  String get synastryRemovedFromSaved => 'Sinastria rimossa dalle salvate';

  @override
  String get chartSetAsPersonal => 'Tema impostato come personale';

  @override
  String get chartRemovedFromPersonal => 'Tema rimosso dai personali';

  @override
  String get viewReading => 'Visualizza lettura';

  @override
  String get generateReading => 'Genera lettura';

  @override
  String get removeFromPersonal => 'Non è il mio tema';

  @override
  String get setAsPersonal => 'È il mio tema';

  @override
  String get removeFromSaved => 'Rimuovi dai salvati';

  @override
  String get removeChart => 'Rimuovi tema';

  @override
  String removeChartConfirmation(Object name) {
    return 'Sei sicuro di voler rimuovere \"$name\" dalle analisi salvate?';
  }

  @override
  String get remove => 'Rimuovi';

  @override
  String get retry => 'Riprova';

  @override
  String get noSavedCharts => 'Nessun tema salvato';

  @override
  String get noSavedChartsDescription =>
      'I temi natali che salvi appariranno qui.';

  @override
  String get noSavedAnalyses => 'Nessuna analisi salvata';

  @override
  String get noSavedAnalysesDescription =>
      'Le analisi che salvi appariranno qui.';

  @override
  String get noSavedSynastries => 'Nessuna sinastria salvata';

  @override
  String get noSavedSynastriesDescription =>
      'Le sinastrie che crei appariranno qui.';

  @override
  String get noSavedBirthChartsDescription =>
      'I temi natali che salvi appariranno qui.';

  @override
  String get personal => 'Personale';

  @override
  String get readingAvailable => 'Lettura disponibile';

  @override
  String get generateReadingAction => 'Genera lettura';

  @override
  String get regenerateReading => 'Rigenera lettura';

  @override
  String get searchCharts => 'Cerca analisi...';

  @override
  String get searchSynastries => 'Cerca sinastrie...';

  @override
  String get continueWithGoogle => 'Continua con Google';

  @override
  String get googleSignInSuccessful =>
      'Accesso con Google completato con successo';

  @override
  String get googleSignUpSuccessful =>
      'Registrazione con Google completata con successo';

  @override
  String googleSignInError(Object error) {
    return 'Errore accesso Google: $error';
  }

  @override
  String googleSignUpError(Object error) {
    return 'Errore registrazione Google: $error';
  }

  @override
  String get or => 'OPPURE';

  @override
  String get profileTitle => 'Profilo';

  @override
  String get profileUpdatedSuccessfully => 'Profilo aggiornato con successo';

  @override
  String get userNotFound => 'Utente non trovato';

  @override
  String get notProvided => 'Non fornito';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get saveChanges => 'Salva modifiche';

  @override
  String get deleteAccount => 'Elimina Account';

  @override
  String get deleteAccountTitle => 'Elimina Account';

  @override
  String get deleteAccountWarning =>
      'Questa azione non può essere annullata. Tutti i tuoi dati, analisi salvate e immagini del profilo saranno eliminati permanentemente.';

  @override
  String get deleteAccountConfirmation =>
      'Sei assolutamente sicuro di voler eliminare il tuo account?';

  @override
  String get typeDeleteToConfirm => 'Digita ELIMINA per confermare';

  @override
  String get deleteConfirmationWord => 'ELIMINA';

  @override
  String get delete => 'Elimina';

  @override
  String get edit => 'Modifica';

  @override
  String get editBirthChart => 'Modifica tema natale';

  @override
  String get givenNameRequired => 'Il nome è obbligatorio';

  @override
  String get familyNameRequired => 'Il cognome è obbligatorio';

  @override
  String get birthTimeRequired => 'Inserisci ora o spunta ora sconosciuta';

  @override
  String get birthChartUpdated => 'Tema natale aggiornato con successo';

  @override
  String get editDaily => 'Modifica newsletter giornaliera';

  @override
  String get editMonthly => 'Modifica newsletter mensile';

  @override
  String get save => 'Salva';

  @override
  String get updateSuccess => 'Newsletter aggiornata con successo';

  @override
  String get accountDeleted => 'Account eliminato con successo';

  @override
  String get preferences => 'Preferenze';

  @override
  String get about => 'Informazioni';

  @override
  String get appVersion => 'Versione App';

  @override
  String get termsOfService => 'Termini di Servizio';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get account => 'Account';

  @override
  String get daily => 'Giornaliere';

  @override
  String get monthly => 'Mensile';

  @override
  String get dailyPredictionsContent =>
      'Le tue previsioni astrologiche giornaliere personalizzate.';

  @override
  String get monthlyPredictionsContent =>
      'Le tue previsioni astrologiche mensili dettagliate.';

  @override
  String get pleaseEnterFirstName => 'Inserisci il nome';

  @override
  String get pleaseEnterLastName => 'Inserisci il cognome';

  @override
  String get pleaseSelectBirthDate => 'Seleziona una data di nascita';

  @override
  String get pleaseSelectBirthTime => 'Seleziona l\'ora di nascita';

  @override
  String errorCreatingBirthChart(Object error) {
    return 'Errore creando il tema natale: $error';
  }

  @override
  String get analyzing => 'ANALIZZANDO...';

  @override
  String get chooseAstrologicalPath => 'Nutrire per essere nutriti';

  @override
  String get semiannual => 'Semestrale';

  @override
  String get annual => 'Annuale';

  @override
  String get premiumMonthly => 'Premium - mensile';

  @override
  String get standardMonthly => 'Standard - mensile';

  @override
  String get premiumSemiannual => 'Premium - semestrale';

  @override
  String get standardSemiannual => 'Standard - semestrale';

  @override
  String get premiumAnnual => 'Premium - annuale';

  @override
  String get standardAnnual => 'Standard - annuale';

  @override
  String get monthPeriod => 'mese';

  @override
  String get billedMonthly => 'Addebito mensile';

  @override
  String get billedSemiannually => 'Fatturati ogni 6 mesi';

  @override
  String get billedAnnually => 'Fatturati annualmente';

  @override
  String get save20Percent => 'Risparmia 20%';

  @override
  String get save40Percent => 'Risparmia 40%';

  @override
  String get save33Percent => 'Risparmia 33%';

  @override
  String get oneMonthFree => '1 mese GRATIS';

  @override
  String get fourMonthsFree => '4 mesi GRATIS';

  @override
  String get birthChartReadings => 'Letture del tema natale';

  @override
  String get couplesChartReadings => 'Letture del tema di coppia';

  @override
  String get horoscopeNewsletter => 'Newsletter oroscopo giornaliero e mensile';

  @override
  String get sevenDaysFreeTrial => '7 giorni di prova gratuita';

  @override
  String get startNow => 'Inizia ora';

  @override
  String get moneyBackGuarantee => 'Garanzia di rimborso di 30 giorni';

  @override
  String get birthChartPreview => 'Anteprima tema natale';

  @override
  String get loginRequiredForFullReading =>
      'Accedi per ottenere la tua lettura personalizzata completa';

  @override
  String get previewTitle => 'Il tuo tema natale è pronto!';

  @override
  String get backToForm => 'Torna al modulo';

  @override
  String get paymentProcessingError =>
      'Si è verificato un errore nel processo di pagamento';

  @override
  String get subscriptionActivated => 'Abbonamento attivato con successo!';

  @override
  String get subscriptionConfirmationFailed =>
      'Impossibile confermare l\'abbonamento. Contatta l\'assistenza.';

  @override
  String get confirmingSubscription => 'Conferma dell\'abbonamento in corso...';

  @override
  String get subscriptionsTitle => 'Abbonamenti';

  @override
  String get subscriptionAmount => 'Importo';

  @override
  String get subscriptionStartDate => 'Iniziato';

  @override
  String get subscriptionEndDate => 'Rinnova';

  @override
  String get subscriptionCancelsOn => 'Cancella';

  @override
  String get manageSubscription => 'Gestisci abbonamento';

  @override
  String get noActiveSubscription => 'Nessun abbonamento';

  @override
  String get reactivateSubscription => 'Riattiva';

  @override
  String get subscriptionActive => 'Attivo';

  @override
  String get subscriptionTrialing => 'Prova';

  @override
  String get loadingSubscriptions => 'Caricamento abbonamenti...';

  @override
  String get failedToLoadSubscriptions =>
      'Impossibile caricare gli abbonamenti';

  @override
  String get paymentFailed => 'Pagamento Fallito';

  @override
  String get paymentFailedDescription =>
      'Il pagamento del tuo abbonamento non è stato elaborato. Aggiorna il metodo di pagamento per continuare a utilizzare i nostri servizi.';

  @override
  String get updatePaymentMethod => 'Aggiorna Metodo di Pagamento';

  @override
  String get subscriptionPastDue => 'Pagamento Scaduto';

  @override
  String get subscriptionUnpaid => 'Pagamento Fallito';

  @override
  String get subscriptionIncomplete => 'Pagamento Incompleto';

  @override
  String get house1Alt => 'Identità ed espressione di sé';

  @override
  String get house2Alt => 'Risorse materiali e valori';

  @override
  String get house3Alt => 'Comunicazione e apprendimento';

  @override
  String get house4Alt => 'Famiglia e fondamenta emotive';

  @override
  String get house5Alt => 'Creatività ed espressione personale';

  @override
  String get house6Alt => 'Lavoro e salute';

  @override
  String get house8Alt => 'Trasformazione e questioni nascoste';

  @override
  String get house9Alt => 'Conoscenza superiore e spiritualità';

  @override
  String get house10Alt => 'Carriera e immagine pubblica';

  @override
  String get house11Alt => 'Amicizie e innovazione';

  @override
  String get house12Alt => 'Trascendenza e regni nascosti';

  @override
  String get exploreMore => 'Approfondisci';

  @override
  String get cavernDetailsTitle => 'Il Libro delle Caverne';

  @override
  String get generalIntroduction => 'Introduzione Generale';

  @override
  String get birthChartNotFound => 'Tema natale non trovato';

  @override
  String get synastryNotFound => 'Sinastria non trovata';

  @override
  String get goToHome => 'Vai alla Home';

  @override
  String get bookOfCaverns => 'Il Libro delle Caverne';

  @override
  String get bookOfCavernsDescription =>
      'Esplora l\'antico Libro delle Caverne egizio e la sua connessione con le case astrologiche';

  @override
  String cavernComingSoon(Object number) {
    return 'Caverna $number - Prossimamente';
  }

  @override
  String get tapToExploreCavern => 'Tocca per esplorare questa caverna';

  @override
  String get contentComingSoon => 'Contenuto in arrivo';

  @override
  String get bookOfCavernsIntroduction =>
      '## I Testi Funerari Egizi e l\'Astrologia\n\nQuesta trattazione delle **12 case astrologiche** è basata su testi funerari egizi del Nuovo Regno che descrivono il viaggio del dio sole Ra attraverso l\'oltretomba, seguendo l\'interpretazione astrologica di Angelo Angelini.\n\n## I due testi fonte\n\nLe dodici caverne qui presentate derivano da due testi egizi distinti:\n\n### Caverne 1-6: Il Libro delle Caverne propriamente detto\nTesto funerario ramesside che descrive il viaggio notturno di Ra attraverso sei sezioni della Duat. Caratterizzato da scene di punizione dei nemici di Ra e Osiride, questo testo è attestato nelle sue versioni più complete nella tomba di Ramses VI (KV9) e nell\'Osireion di Seti I ad Abydos.\n\nL\'egittologia contemporanea sostiene che il Libro delle Caverne contenga in realtà tutte e dodici le caverne, organizzate con più caverne per sezione ([Power, 2015](https://doi.org/10.17638/03032971)). Per questa trattazione astrologica seguiamo tuttavia l\'interpretazione di Angelini che assimila ognuna delle sei sezioni a una casa astrologica.\n\n### Caverne 8-12: Il Libro delle Dodici Caverne\nConosciuto anche come **Incantesimo delle Caverne**, questo testo fu a lungo considerato parte del Libro dei Morti. Alexandre Piankoff ha dimostrato che si tratta invece di una composizione indipendente con carattere liturgico benevolo: le divinità concedono favori al defunto senza scene di punizione.\n\nLe prime sette caverne del Libro delle Dodici Caverne sono rappresentate in maniera estremamente sintetica e schematica, dando ben poche informazioni sul loro contenuto, mentre sono soltanto le ultime cinque (dalla 8 alla 12) a essere descritte in maniera dettagliata.\n\nAngelo Angelini interpreta l\'ottava caverna del Libro delle Dodici Caverne come l\'ottava casa astrologica - un collegamento simbolico, non filologico.\n\n## Il significato di \"Caverna\"\n\nIn egizio **Kerreret** o **Kerret**:\n\n![Geroglifico di Kerreret](caverna.webp)\n\nSecondo Angelo Angelini, il geroglifico combina:\n- **Q** (triangolo): la materia da lavorare\n- **Semi**: il tempo\n- **Rettangolo aperto**: lo spazio\n\nIl termine indica quindi \"uno spazio temporale\" - essenza della domificazione astrologica, dove il tempo celeste (transiti planetari) si cristallizza in esperienza terrena.\n\n## Fonti\n\n### Libro delle Caverne (caverne 1-6)\n- **Ricostruzione filologica**: Werning, D. A. (2019). The Book of Caverns in Theban Tomb 33: Late Period reception process and individual adaptation. *Bulletin de l\'Institut français d\'archéologie orientale*, *118*, 525-554. [https://doi.org/10.4000/bifao.5059](https://doi.org/10.4000/bifao.5059)\n- **Interpretazione iconografica**: Power, D. M. (2019). *Aspects of iconography and transmission in the Book of Caverns* [Tesi di dottorato]. University of Liverpool. [https://doi.org/10.17638/03032971](https://doi.org/10.17638/03032971)\n- **Fonte iconografica**: [Theban Mapping Project](https://thebanmappingproject.com/tombs/kv-09-rameses-v-and-rameses-vi), tomba di Ramses VI\n\n### Libro delle Dodici Caverne (caverne 8-12)\n- **Ricostruzione filologica**: Méndez Rodríguez, D. M. (2015). The transmission of the Book of the Twelve Caverns. In G. Rosati & M. C. Guidotti (Eds.), *Proceedings of the XI International Congress of Egyptologists* (pp. 405-409). Archaeopress. [https://doi.org/10.2307/j.ctv177tjnf.77](https://doi.org/10.2307/j.ctv177tjnf.77)\n- **Interpretazione iconografica**: Piankoff, A. (1974). *The wandering of the soul*. Princeton University Press. [https://archive.org/details/wanderingofsoul0006pian](https://archive.org/details/wanderingofsoul0006pian)\n- **Fonte iconografica**: [Papiro EA 10478](https://www.britishmuseum.org/collection/object/Y_EA10478-6), British Museum\n\n### Interpretazione astrologica\n- Angelini, A. (1992). *Manuale di astrologia egizia*. Kemi.\n\n**Nota**: I colori nelle illustrazioni delle caverne 1-6 sono suggestivi e hanno funzione comunicativa per evocare l\'atmosfera dell\'oltretomba, non filologica, in quanto gli originali su parete sono molto deteriorati. Per le caverne 8-12 sono stati utilizzati i colori originali del Papiro EA 10478 del British Museum.';

  @override
  String get firstCavernTitle => 'Prima caverna - Il portale dell\'ingresso';

  @override
  String get firstCavernLiteralMeaning =>
      'La Prima Divisione è composta da 5 registri (R) e 13 scene (S), con una precisa struttura iconografica:\n\n[TABLE_CAVERNA_1]\n\n![Struttura della divisione](prima_divisione.webp)\n\nQuesta divisione inizia con tre guardiani serpentini che Ra deve convincere per permettergli di entrare nell\'Oltretomba.\n\nQuesta divisione contiene anche la prima apparizione di divinità racchiuse in ovali e la prima apparizione di Osiride in un santuario. Include inoltre elementi del corpo di Osiride, rappresentati dai due dischi sollevati sopra le teste delle divinità e dai pezzi di carne che appaiono nei tumuli nel R4, S3. L\'inclusione di parti del corpo di Osiride simboleggia gli elementi necessari per l\'**unità Solare-Osiriaca** - il processo attraverso cui Ra (il sole diurno) e Osiride (il sole notturno e la forza rigeneratrice della morte) si fondono per completare il ciclo cosmico di morte e rinascita, permettendo la resurrezione quotidiana del sole.\n\nIl registro inferiore è infine riservato alla punizione dei nemici di Ra e Osiride.';

  @override
  String get firstCavernEsotericMeaning =>
      '## Figli della terra\n\nAll\'ingresso delle caverne, Ra si rivolge ai tre Serpenti guardiani con le parole: \"O Figlio della Terra\". Questa invocazione introduce il tema fondamentale della **dimensione terrestre della domificazione**: le case astrologiche nascono dall\'incontro tra il cielo (lo Zodiaco) e la Terra (l\'orizzonte al momento della nascita), radicando le energie cosmiche nella realtà concreta dell\'esperienza umana.\n\n## Gli ovali come involucri magnetici\n\nGli **ovali che racchiudono le divinità** vengono tradizionalmente identificati come sarcofagi. Tuttavia, a un livello di interpretazione più profonda, sono da interpretarsi come **involucri magnetici**: aure che circondano le entità divine impedendo che le loro energie si disperdano. I corpi nei loro sepolcri sono quindi fasci di energie che si risolvono in materia, avviluppati da questa ampolla magnetica.\n\n## La prima casa\n\nIn termini astrologici, la Prima Caverna corrisponde alla **Prima Casa**: la casa dell\'Ascendente, del Sé e dell\'identità individuale. Questa caverna rappresenta l\'inizio del percorso iniziatico attraverso le dodici case astrologiche, dove l\'anima umana deve confrontarsi con le forze terrestri e celesti per completare il proprio processo di evoluzione spirituale.';

  @override
  String get secondCavernTitle =>
      'Seconda caverna - La caverna del sostentamento';

  @override
  String get secondCavernLiteralMeaning =>
      'La Seconda Divisione è composta da 5 registri (R) e 10 scene (S), il cui contenuto è contenuto nella seguente tabella:\n\n[TABLE_CAVERNA_2]\n\n![Struttura della seconda divisione](seconda_divisione.webp)\n\nQuesta divisione inizia, come la prima, con guardiani serpentini che Ra deve convincere per accedere all\'Oltretomba. Contiene vari gruppi di ovali con elementi solari e osiriaci.\n\n## Le divinità dalla testa di pesce gatto\n\nLe **divinità dalla testa di pesce gatto** (R1, S2) sono chiamate **Nariu** e sono associate all\'iscrizione: \"O Nariu, signori del sostentamento, che sono diventati come Osiride...\".\n\n## La morte di Osiride\n\nLa morte di Osiride è evidenziata dalle **divinità che lo piangono** (R2, S1) e dalle divinità che custodiscono una **cassa contenente il corpo di Osiride** (R3, S2).';

  @override
  String get secondCavernEsotericMeaning =>
      '## La caverna del nutrimento\n\nSecondo Angelini, la Seconda Caverna ha come tema centrale il nutrimento e l\'abbondanza. Ra si rivolge alle divinità: \"Io vi illumino, o afflitte, e vi rendo soddisfatte con il vostro sostentamento\". I **Nariu** sono dei primevi dell\'abbondanza e del nutrimento, rappresentati con la testa di pesce gatto.\n\n## La seconda casa astrologica\n\nQuesta caverna corrisponde alla **seconda casa**: il luogo dove l\'individuo trova le risorse necessarie per la propria sopravvivenza fisica. È la casa dei guadagni e delle entrate, che rivela l\'impulso di raccogliere e accumulare tutto ciò che serve per mantenere e proteggere l\'esistenza materiale.';

  @override
  String get thirdCavernTitle =>
      'Terza caverna - La caverna delle relazioni formatrici';

  @override
  String get thirdCavernLiteralMeaning =>
      'La Terza Divisione è composta da 3 registri (R) e 13 scene (S), il cui contenuto è contenuto nella seguente tabella:\n\n[TABLE_CAVERNA_3]\n\n![Struttura della terza divisione](terza_divisione.webp)\n\nIn questa divisione Ra entra fisicamente nell\'Oltretomba dopo aver ottenuto l\'accesso dai guardiani alle porte. Questa divisione è il punto di partenza per l\'**unità Solare-Osiriaca**, processo necessario affinché il dio sole Ra possa rinascere al mattino. L\'unità è rappresentata nella scena centrale (R2, S3) dove appare Osiride itifallico disteso con un disco solare sopra il fallo eretto.\n\n## Le divinità dalla testa di pesce gatto\n\nNel primo registro (R1, S2) compaiono **7 divinità dalla testa di pesce gatto** che si trovano sotto un serpente. Queste sono associate al testo che si rivolge agli \"dei che sono nell\'ovile di Neheb-Kau\".\n\n## La doppia sfinge Aker\n\nLa scena centrale mostra la **doppia sfinge Aker** con Osiride itifallico circondato da un serpente, rappresentando il momento in cui inizia l\'unità tra Ra e Osiride. Aker è l\'antica divinità egizia della terra e guardiano dell\'Oltretomba, raffigurata come doppia sfinge che protegge il dio sole durante il suo viaggio notturno attraverso l\'aldilà.';

  @override
  String get thirdCavernEsotericMeaning =>
      '## La caverna delle qualità spirituali\n\nSecondo Angelini, la Terza Caverna si caratterizza per la presenza di **Neheb-Kau**, il grande dio primevo serpentino. Il suo nome significa \"Colui che unisce i Ka\" ed è anche tradotto concettualmente come \"Elargitore di dignità\", ovvero colui che assegna posizioni e onori nell\'aldilà. Il **Ka** nella concezione egizia è la forza vitale, il doppio spirituale che distingue i vivi dai morti e che deve essere nutrito e preservato per garantire la continuità nell\'aldilà.\n\n## L\'unificatore degli attributi\n\nNeheb-Kau viene chiamato negli antichi testi \"unificatore di attributi\", ovvero colui che riunisce e coordina le diverse qualità e caratteristiche spirituali necessarie per l\'esistenza completa nell\'aldilà. È considerato il \"Ka di ogni dio\" e la sua funzione era quella di dotare dèi e umani di vita.\n\n## La terza casa astrologica\n\nQuesta caverna corrisponde alla **terza casa**: il luogo della raccolta degli elementi per la formazione dello Spirito. È la casa dell\'istruzione, delle idee che formano la nuova personalità e dei rapporti con gli altri. Secondo Angelini, rappresenta il movimento centripeto rivolto verso l\'acquisizione di qualità che nutrono lo Spirito.';

  @override
  String get divisionStructureAlt3 => 'Struttura della Terza Divisione';

  @override
  String get divisionStructureAlt4 => 'Struttura della Quarta Divisione';

  @override
  String get literalMeaning => 'Significato letterale';

  @override
  String get esotericMeaning => 'Significato esoterico';

  @override
  String get cavernDetailsNotFound => 'Dettagli caverna non trovati';

  @override
  String get firstDivisionTitle => 'Prima Divisione';

  @override
  String get secondDivisionTitle => 'Seconda Divisione';

  @override
  String get table1R1S1 => '3 serpenti arrotolati';

  @override
  String get table1R1S2 => '9 cobra';

  @override
  String get table1R1S3 => '9 divinità dalla testa di toro';

  @override
  String get table1R2S1 => '9 divinità maschili negli ovali';

  @override
  String get table1R2S2 => '9 divinità dalla testa di sciacallo';

  @override
  String get table1R2S3 =>
      'Divinità maschile e femminile che reggono un disco sopra la testa';

  @override
  String get table1R3S1 => '11 divinità';

  @override
  String get table1R3S2 =>
      'Osiride in un santuario con 8 divinità maschili e femminili negli ovali che lo circondano';

  @override
  String get table1R4S1 => '9 divinità femminili in piedi su ceste';

  @override
  String get table1R4S2 => '8 divinità femminili negli ovali';

  @override
  String get table1R4S3 =>
      '2 divinità maschili ai lati di un tumulo; 2 divinità femminili ai lati di un tumulo; Divinità dalla testa di mangusta';

  @override
  String get table1R5S1 => '3 serpenti arrotolati';

  @override
  String get table1R5S2 => '16 nemici maschi (8 decapitati)';

  @override
  String get table2R1S1 => 'Serpente alzato sulla coda + 4 serpenti arrotolati';

  @override
  String get table2R1S2 =>
      '4 divinità dalla testa di pesce gatto e 8 divinità dalla testa di toporagno negli ovali + due divinità dalla testa di falco';

  @override
  String get table2R1S3 =>
      '7 divinità femminili negli ovali + divinità maschile';

  @override
  String get table2R2S1 =>
      'Divinità dalla testa di toporagno + 9 piangenti maschi';

  @override
  String get table2R2S2 =>
      '12 divinità maschili mummificate negli ovali + divinità dalla testa di ariete';

  @override
  String get table2R3S1 =>
      'Divinità dalla testa di ariete + 9 divinità maschili';

  @override
  String get table2R3S2 =>
      '4 maschi attorno al petto di Osiride + 4 stendardi dalla testa di ariete + 4 stendardi dalla testa di sciacallo';

  @override
  String get table2R4S1 =>
      'Divinità dalla testa di falco + 12 figure di Osiride negli ovali + divinità maschile';

  @override
  String get table2R4S2 =>
      'Divinità dalla testa di ariete + 9 divinità dalla testa di ariete negli ovali + 1 divinità dalla testa di ariete';

  @override
  String get table2R5S1 =>
      '4 divinità maschili con corna di toro che reggono coltelli + 16 nemici maschi (4 decapitati; 4 distesi a faccia in giù; ultimi 8 capovolti)';

  @override
  String get table3R1S1 =>
      'Disco solare + 2 serpenti arrotolati + 1 divinità maschile in un ovale';

  @override
  String get table3R1S2 =>
      '7 divinità dalla testa di pesce gatto in piedi sotto un serpente';

  @override
  String get table3R1S3 =>
      '2 divinità mummificate dalla testa di ariete in tumuli';

  @override
  String get table3R1S4 => '3 divinità maschili e femminili negli ovali';

  @override
  String get table3R1S5 =>
      'Osiride in un santuario + 10 divinità maschili e femminili negli ovali';

  @override
  String get table3R2S1 => 'Divinità dalla testa di ariete';

  @override
  String get table3R2S2 => '4 figure di Osiride';

  @override
  String get table3R2S3 =>
      'Doppia sfinge Aker + Osiride itifallico disteso circondato da un serpente';

  @override
  String get table3R2S4 =>
      '3 ovali circondati da un serpente uroboro + 4 divinità maschili';

  @override
  String get table3R2S5 =>
      'Divinità dalla testa di mangusta in piedi su un serpente + 2 divinità maschili';

  @override
  String get table3R3S1 =>
      '4 figure maschili capovolte + 4 figure femminili capovolte + 1 figura maschile';

  @override
  String get table3R3S2 => '8 nemici maschi capovolti (4 decapitati)';

  @override
  String get table3R3S3 =>
      '4 nemici femminili capovolti + 4 uccelli ba capovolti';

  @override
  String get centralScene => 'scena centrale';

  @override
  String get fourthCavernTitle => 'Quarta caverna - La caverna delle origini';

  @override
  String get fourthCavernLiteralMeaning =>
      'La Quarta Divisione è composta da 3 registri (R) e 9 scene (S), il cui contenuto è contenuto nella seguente tabella:\n\n[TABLE_CAVERNA_4]\n\n![Struttura della quarta divisione](quarta_divisione.webp)\n\nIn questa divisione continua il tema dell\'**unità Solare-Osiriaca** iniziata nella Terza Divisione. Il tema è presente nel primo registro (R1, S1) che mostra un\'immagine di Osiride piegato a forma di mezzaluna, con un disco solare ai suoi piedi, sollevato da Iside e Nefti.';

  @override
  String get fourthCavernEsotericMeaning =>
      '## La caverna della famiglia\n\nSecondo Angelini, la Quarta Caverna rappresenta la **radice, la casa paterna, l\'origine e il focolare**. Le figure centrali sono i membri della famiglia divina: Osiride (il padre), Horus (il figlio ed erede), Iside e Nefti (le sorelle che proteggono e rigenerano). Questi rapporti familiari rivelano la natura della caverna come fondamento dell\'esistenza.\n\n## La quarta casa astrologica\n\nQuesta caverna corrisponde alla **quarta casa**: la casa delle origini familiari e delle radici ancestrali. È il luogo dove l\'individuo trova la propria identità primaria e il senso di appartenenza. Rappresenta le basi emotive su cui si costruisce l\'esistenza, il nucleo familiare che fornisce sicurezza e continuità.';

  @override
  String get table4R1S1 =>
      'Osiride umano piegato a forma di mezzaluna sollevato da Iside e Nefti';

  @override
  String get table4R1S2 => 'Anubis + Osiride umano + Horus';

  @override
  String get table4R1S3 => 'Divinità maschile con corna di toro + 2 ovali';

  @override
  String get table4R2S1 =>
      'Divinità dalla testa di ariete + 3 figure di Osiride umane';

  @override
  String get table4R2S2 =>
      'Horus + serpente arrotolato che separa 2 ovali, ciascuno contenente una figura mummiforme';

  @override
  String get table4R2S3 => 'Anubis + Osiride umano + uccello ba';

  @override
  String get table4R3S1 =>
      '4 nemici maschi capovolti + divinità dalla testa di gatto';

  @override
  String get table4R3S2 =>
      'Divinità femminile dalla testa di leone + 1 divinità femminile + 1 divinità maschile distesa';

  @override
  String get table4R3S3 => '4 nemici maschi capovolti + figura maschile';

  @override
  String get fifthCavernTitle =>
      'Quinta caverna - La caverna dei bambini divini';

  @override
  String get fifthCavernLiteralMeaning =>
      'La Quinta Divisione rappresenta **l\'inizio della rinascita del dio sole Ra**, come indicato chiaramente nei testi antichi. È strutturata in tre registri con quattordici scene:\n\n[TABLE_CAVERNA_5]\n\n![Struttura della quinta divisione](quinta_divisione.webp)\n\nL\'avvio del processo di rinascita è simboleggiato dalla **grande immagine di Nut** all\'inizio della divisione, la dea del cielo che partorisce il sole ogni mattina.\n\nAl centro della divisione appare la **grande figura di Osiride itifallico** - Osiride rappresentato con il fallo eretto, simbolo di potenza rigeneratrice e di resurrezione - che continua il processo di unità Solare-Osiriaca: il temporaneo unirsi notturno di Ra (il sole) con Osiride (la morte rigeneratrice) necessario perché il sole possa rinascere ogni mattina.\n\nLa rinascita è ulteriormente simboleggiata da **due bambini seduti in un ovale** (R1, S3-1), chiamati \"Il Giovane Ra\" e \"Il Bambino Ra\", che rappresentano le prime manifestazioni del dio sole. Nella scena **R1, S1(2)** appaiono i **pezzi di carne di Osiride**, elementi del corpo smembrato che devono essere ricomposti per permettere la resurrezione.';

  @override
  String get fifthCavernEsotericMeaning =>
      '## La quinta casa astrologica\n\nQuesta caverna corrisponde alla **quinta casa**: la casa dell\'amore, della creatività e della generazione. È il luogo dove l\'energia vitale si esprime attraverso la creazione, sia materiale che spirituale. Rappresenta i figli, l\'espressione artistica e tutto ciò che nasce dall\'impulso creativo dell\'individuo.';

  @override
  String get table5Division => 'Quinta Divisione';

  @override
  String get table5R1S1P1 =>
      'Osiride umano + 4 serpenti eretti con teste umane';

  @override
  String get table5R1S2P1 => 'Tatenen affiancato da 2 divinità maschili';

  @override
  String get table5R1S3P1 => 'Divinità maschile + 2 ovali';

  @override
  String get table5R1S1P2 =>
      'Ovale affiancato da una divinità maschile e una divinità dalla testa di ariete';

  @override
  String get table5R2S1P1 => '4 mummie dalla testa di falco + Anubis + ovale';

  @override
  String get table5R2S2P1 => '4 divinità femminili ciascuna in un ovale';

  @override
  String get table5R2S1P2 =>
      'Divinità dalla testa di ariete + divinità femminile';

  @override
  String get table5R2S2P2 =>
      'Osiride umano con Horus dalla testa di ariete tra loro';

  @override
  String get table5R3S1P1 =>
      'Dea femminile che tiene una polla in ciascuna mano, con 2 nemici maschi inginocchiati di fronte a lei';

  @override
  String get table5R3S2P1 =>
      'Serpente dalla testa umana (?) che si inginocchia di fronte a un calderone contenente 4 teste e 4 cuori';

  @override
  String get table5R3S3P1 =>
      '2 cobra su entrambi i lati di un calderone contenente 4 nemici maschi decapitati capovolti';

  @override
  String get table5R3S1P2 =>
      '2 divinità femminili inginocchiate su entrambi i lati di un calderone contenente 4 uccelli ba capovolti + 4 ventagli';

  @override
  String get largeIthyphallicOsiris => 'Grande Osiride Itifallico';

  @override
  String get largeNut => 'Grande Nut';

  @override
  String get swipeToView => 'Scorri per visualizzare';

  @override
  String get sixthCavernTitle => 'Sesta caverna - La caverna del servizio';

  @override
  String get sixthCavernLiteralMeaning =>
      'La Sesta Divisione rappresenta **il compimento del processo di rinascita** iniziato nella quinta divisione. È strutturata in tre registri con tredici scene:\n\n[TABLE_CAVERNA_6]\n\n![Struttura della sesta divisione](sesta_divisione.webp)\n\nIl tema centrale è la **nascita imminente del dio sole Ra**. Questo è simboleggiato dalla figura dello **scarabeo che emerge da tra due tumuli** (R2, S1), immagine che rappresenta il dio sole che sta per nascere dopo aver completato il suo viaggio notturno attraverso l\'Oltretomba.\n\nLa divisione contiene anche altre figure connesse alla rinascita: l\'immagine di **Tatenen** (R2, S3), divinità funeraria rappresentante la terra emersa dal Caos primordiale, creatore dell\'energia primordiale, **arieti** (R1, S2) e **teste di ariete** (R1, S3 e R2, S3), tutti simboli associati al dio sole e al processo rigenerativo.\n\nIl registro inferiore mantiene la consueta rappresentazione dei **nemici decapitati** (R3, S1), simboleggiando la sconfitta delle forze del caos che si oppongono alla rinascita solare.';

  @override
  String get sixthCavernEsotericMeaning =>
      '## La sesta casa astrologica\n\nQuesta caverna corrisponde alla **sesta casa**: la casa del lavoro, della salute e del servizio, che **termina la zona oscura della domificazione**. È la casa della **sconfitta del caos**, simboleggiata dalle teste decapitate (R3, S1) che rappresentano le forze del disordine definitivamente vinte.\n\nLa Sesta Casa rappresenta il **fulcro della trasformazione spirituale attraverso il sacrificio**. È il luogo dove, mediante la disciplina, il servizio e l\'accettazione delle difficoltà, l\'individuo sconfigge il caos interiore e può accedere a piani superiori di consapevolezza. Come Ra rinasce ogni mattino dopo aver sconfitto le forze del caos notturno, così il sacrificio diventa strumento di rigenerazione, trasformando la sofferenza in crescita spirituale.';

  @override
  String get table6Division => 'Sesta Divisione';

  @override
  String get table6R1S1 =>
      'Anubis in piedi tra due ovali, ognuno contenente una divinità mummificata + un uccello ba sopra ogni ovale';

  @override
  String get table6R1S2 => 'Anubis + tre ovali';

  @override
  String get table6R1S3 => '2 divinità femminili ai lati di 2 ovali';

  @override
  String get table6R1S4 =>
      'Osiride-Orione in piedi sopra un tumulo contenente un nemico decapitato + divinità maschile + falco seduto sopra un tumulo';

  @override
  String get table6R2S1 =>
      'Scarabeo che emerge tra 2 tumuli + 4 divinità maschili';

  @override
  String get table6R2S2 =>
      'Scarabeo circondato da un serpente + 2 divinità maschili negli ovali';

  @override
  String get table6R2S3 =>
      'Tumulo con serpente arrotolato e testa di ariete che emerge + Tatenen in un tumulo che emerge dal terreno + 2 divinità maschili';

  @override
  String get table6R2S4 => '2 divinità negli ovali';

  @override
  String get table6R2S5 => '4 nemici decapitati negli ovali';

  @override
  String get table6R3S1 =>
      '4 nemici decapitati + divinità maschili e femminili con coltelli + divinità femminile';

  @override
  String get table6R3S2 =>
      '2 divinità femminili dalla testa di Anubis + 4 nemici femminili';

  @override
  String get table6R3S3 =>
      'Divinità maschili e femminili + 4 nemici maschi inginocchiati';

  @override
  String get table6R3S4 =>
      'Osiride che emerge da tra un serpente + 2 figure maschili capovolte con le teste nel terreno';

  @override
  String get seventhCavernTitle =>
      'Settima caverna - La caverna della sacra unione';

  @override
  String get seventhCavernLiteralMeaning =>
      'Seguendo l\'interpretazione di Angelo Angelini, le **prime sei caverne** corrispondono alle sei sezioni del Libro delle Dodici Caverne dell\'Osireion di Abydos, mentre le **altre caverne sono rappresentate solo nei papiri**.\n\nSecondo questa interpretazione, la Settima Caverna **non ha alcuna attestazione** in nessuna delle due fonti: è assente dai rilievi dell\'Osireion e **\"Manca nei Papiri\"** come Angelini esplicitamente afferma.';

  @override
  String get seventhCavernEsotericMeaning =>
      '## La settima casa astrologica\n\nQuesta caverna corrisponde alla **settima casa**: la casa delle partnership, del matrimonio, dei nemici aperti e dei contratti legali. Tuttavia, secondo Angelini, **\"Della settima casa nulla si può dire poichè non si hanno elementi di discusione\"**.\n\n## Il passaggio dalla notte al giorno\n\nLa settima caverna rappresenta **il passaggio dalla parte notturna a quella diurna della domificazione**, ovvero quella sotto la linea dell\'ascendente e quella sopra la linea dell\'ascendente. La completa assenza di questa caverna da tutte le fonti - sia i rilievi dell\'Osireion che i papiri - mantiene nascosto il significato esoterico di questa casa di transizione.';

  @override
  String get eighthCavernTitle =>
      'Ottava caverna - La caverna della trasformazione';

  @override
  String get eighthCavernLiteralMeaning =>
      'L\'Ottava Caverna, chiamata **\"Colei che protegge le Anime, Colei che giudica distinguendo la verità dalla falsità\"**, è organizzata in **sette gruppi di divinità**, ciascuno con funzioni specifiche nell\'organizzazione divina dell\'Oltretomba.\n\n![Struttura dell\'ottava divisione](ottava_divisione.webp)\n\n## Rappresentazioni diverse tra le fonti\n\nLe fonti antiche presentano due modalità di rappresentazione:\n\n- **Nell\'Osireion di Abydos**: Ogni gruppo è raffigurato *in extenso* con tutte le divinità (generalmente quattro per gruppo) mostrate in processione\n- **Nei papiri** (come il British Museum 10.478 mostrato sopra): **Ogni gruppo è rappresentato simbolicamente da una singola figura inscritta in un rettangolo**, con il numero dei membri del gruppo indicato sotto la figura. Questa divinità singola rappresenta l\'intero collettivo.\n\n## I Sette Gruppi di Divinità\n\n### Gruppo 1: \"Coloro che portano [quelli che sono seduti] su di loro\"\n**Rappresentazione nel papiro**: Una divinità che cammina portando una figura bambina seduta sulla spalla, con il numero \"4\" sotto.\n**Significato**: Quattro divinità che garantiscono al defunto di \"vedere Ra al suo sorgere\" e di seguirlo \"nella barca di Ra\".\n\n### Gruppo 2: \"Coloro che portano quelli che sono [seduti] su di loro\"\n**Rappresentazione nel papiro**: Una divinità che porta un bambino maschio seduto sulla spalla, con il numero \"4\".\n**Significato**: Quattro divinità che trasportano personaggi maschili seduti, concedendo gli stessi benefici del primo gruppo.\n\n### Gruppo 3: \"Coloro che piangono per Ra\"\n**Rappresentazione nel papiro**: Una dea prostrata a faccia in giù con ciocche di capelli davanti al volto e mani alzate, con il numero \"4\".\n**Significato**: Quattro figure che garantiscono \"le offerte al defunto come ai seguaci di Ra al tramonto\".\n\n### Gruppo 4: \"Coloro che portano doni\"\n**Rappresentazione nel papiro**: Una dea prostrata a faccia in giù con mani alzate, con il numero \"4\".\n**Significato**: Quattro figure che tengono pane rotondo e concedono al defunto di \"essere come coloro che sono nell\'Oltretomba\".\n\n### Gruppo 5: \"Gli Stanchi\"\n**Rappresentazione nel papiro**: Una dea prostrata con capelli davanti al volto e mani alzate verso l\'interno.\n**Significato**: Quattro figure che permettono al defunto di \"attraversare la Grande Sala delle Due Verità\".\n\n### Gruppo 6: \"Coloro che rendono omaggio\"\n**Rappresentazione nel papiro**: Un dio che si inchina, con il numero \"4\".\n**Significato**: Quattro divinità che garantiscono che il defunto possa \"seguire Ra nella sua barca\".\n\n### Gruppo 7: \"Coloro che portano offerte\"\n**Rappresentazione nel papiro**: Un dio che cammina tenendo un oggetto conico.\n**Significato**: Quattro divinità che concedono \"offerte e cibo al defunto nella Necropoli\".';

  @override
  String get eighthCavernEsotericMeaning =>
      '## La caverna dell\'assistenza divina e del discernimento spirituale\n\nSecondo Angelini, l\'Ottava Caverna rappresenta prima di tutto l\'**assistenza divina per l\'ascensione spirituale**. Le divinità che \"portano coloro che sono seduti su di loro al cielo\" simboleggiano concretamente come le forze spirituali superiori forniscano un veicolo di elevazione attraverso una profonda introspezione.\n\n## Il discernimento tra verità e falsità\n\nIl nome stesso della caverna - \"Colei che giudica distinguendo la verità dalla falsità\" - rivela la sua funzione essenziale. Le divinità descritte come \"giudici delle anime\" non rappresentano un tribunale esterno, ma il **processo interiore di discernimento** che ogni ricercatore spirituale deve sviluppare. Le figure prostrate (Gruppi 3, 4, 5) mostrano i pericoli di questa ricerca: \"Coloro che piangono per Ra\" avvertono delle deviazioni possibili negli studi metafisici e nelle ricerche sull\'aldilà.\n\n## La dualità delle risorse spirituali e materiali\n\nMentre la seconda caverna governa i guadagni dal proprio lavoro, l\'ottava regola le **risorse ricevute attraverso altri**: i \"Coloro che portano doni\" e \"Coloro che portano offerte\" (Gruppi 4 e 7) indicano sia i doni materiali (eredità, lasciti) che le esperienze trasformative che arrivano inaspettatamente. Angelini specifica che questi \"doni\" possono derivare anche dal matrimonio con persone più agiate.\n\n## Il pericolo della ricerca occulta\n\nLe figure prostrate rappresentano il **significato mortifero dell\'ottava casa**: la ricerca negli studi soprannaturali comporta rischi reali. Gli \"Stanchi\" (Gruppo 5) simboleggiano \"coloro che giungono al termine della vita\" per aver percorso incorrettamente il sentiero della conoscenza nascosta. Tuttavia, chi riesce a \"distinguere la verità dalla falsità\" può \"attraversare la Grande Sala delle Due Verità\".\n\n## L\'ottava casa come processo alchemico\n\nQuesta caverna rappresenta il **processo alchemico di morte e rinascita** - la dissoluzione delle forme antiche per permettere la nuova crescita spirituale. È la casa della trasformazione radicale, dove l\'investigazione nelle \"cose nascoste\" può condurre tanto all\'illuminazione quanto alla distruzione spirituale.';

  @override
  String get ninthCavernTitle =>
      'Nona caverna - La caverna della saggezza divina';

  @override
  String get ninthCavernLiteralMeaning =>
      'La Nona Caverna, chiamata **\"Colei dalle forme misteriose, che taglia l\'aria [vitale]\"**, è organizzata in **venti gruppi di divinità**, il più complesso tra tutte le caverne.\n\n![Struttura della nona divisione](nona_divisione.webp)\n\n## Rappresentazioni diverse tra le fonti\n\nCome per l\'Ottava Caverna, le fonti presentano due modalità:\n- **Nell\'Osireion di Abydos**: Ogni gruppo mostrato con tutte le divinità\n- **Nei papiri**: Rappresentazione simbolica con una figura per gruppo\n\n## I Venti Gruppi di Divinità\n\n### Gruppo 1: \"Gli dei che sono nei loro templi sopra l\'Abisso Acquatico\"\n**Rappresentazione**: Figura mummificata di Osiride con corona dell\'Alto Egitto in un tempio con serpenti, numero \"14\".\n**Significato**: Quattordici divinità che garantiscono al defunto di \"bere nel mezzo della corrente\".\n\n### Gruppo 2: \"Gli dei e dee che sono al seguito di Osiride\"\n**Rappresentazione**: Dea in piedi seguita da un dio con scettro, numero \"24\".\n**Significato**: Ventiquattro divinità (12 dei e 12 dee) che permettono al defunto di \"riposare con la sua mummia\".\n\n### Gruppo 3: \"Colui che Sta in Piedi\"\n**Rappresentazione**: Dio che cammina con scettro, numero \"1\".\n**Significato**: Una divinità che garantisce al defunto di \"adorare Ra al suo sorgere\".\n\n### Gruppi 4, 6-7: Divinità Taurine\n**Gruppo 4**: \"Amun-Osiride\" - Toro su stendardo con ureo che concede \"potere nella Grande Sala di Geb\". L\'**ureo** è il cobra sacro eretto, simbolo di sovranità e protezione divina, che ornava la fronte dei faraoni e rappresentava la dea Wadjet.\n**Gruppo 6**: \"Colui che nutre Osiride\" - Toro su stendardo portato da dio mummiforme, concede pane e birra al defunto\n**Gruppo 7**: \"Colui che rende Osiride inaccessibile\" - Toro su stendardo che protegge Osiride nel mondo sotterraneo, concede padronanza dei passi nel Luogo Sacro\n\n### Gruppo 5: \"Il Misterioso\"\n**Rappresentazione**: Dio mummiforme in piedi.\n**Significato**: Divinità che garantisce al defunto un \"corpo duraturo e sano\".\n\n### Gruppi 8-11: Divinità Protettive\n**Gruppo 8**: \"Il Protettore\" - Dio mummiforme che non permette al male di avvicinarsi al defunto\n**Gruppo 9**: \"Colui che Traghetta Osiride\" - Divinità che guida Osiride attraverso l\'oltretomba, permette di vedere Ra\n**Gruppo 10**: \"L\'Oscuro\" - Dio mummiforme che concede gloria sulla terra e potere nell\'Occidente\n**Gruppo 11**: \"Colui-che-è-tra-i-due-occhi\" - Dio dalla testa di coccodrillo che porta il defunto davanti ai bracieri sacri\n\n### Gruppi 12-14: Figure con Braccia Nascoste\n**Gruppo 12**: \"Gli assistenti di Osiride\" - Quattro dee mummificate che accompagnano il defunto accanto al Grande Dio dell\'Occidente\n**Gruppo 13**: \"Quelli dalle braccia nascoste\" (maschili) - Quattro dei mummiformi con braccia celate sotto le vesti, garantiscono al defunto di rimanere nella Necropoli per sempre\n**Gruppo 14**: \"Quelle dalle braccia nascoste\" (femminili) - Quattro dee mummificate con braccia celate, assicurano prosperità e offerte durature\n\n### Gruppi 15-20: Divinità Specializzate\n**Gruppo 15**: \"Colui che nasconde le membra\" - Dio con scettro\n**Gruppo 16**: \"Le Anime che escono\" - Quattro uccelli su alberi\n**Gruppo 17**: \"Quelli dei sicomori\" - Quattro dei mummificati\n**Gruppo 18**: \"Colui dal Volto Ripugnante\" - Dio mummiforme\n**Gruppo 19**: \"Gli Splendenti\" - Nove dei con dischi solari\n**Gruppo 20**: \"Quelli che si riposano sui loro letti\" - Nove dei coricati';

  @override
  String get ninthCavernEsotericMeaning =>
      '## La caverna dell\'ordine metafisico e della religiosità profonda\n\nSecondo Angelini, la Nona Caverna rappresenta l\'**ordine metafisico, religioso, giuridico e mistico**. Il Gruppo 1 - \"Gli dei nei loro templi sopra l\'Abisso Acquatico\" - rivela immediatamente la **religiosità profonda** di questa casa, dove la figura mummificata di Osiride nel tempio stabilisce il carattere sacro e spirituale del dominio.\n\n## I principi spirituali superiori\n\nLe divinità \"nei loro templi sopra le Acque dell\'Abisso (Nu)\" (Gruppo 1) rappresentano i **principi spirituali superiori** che governano dall\'alto. Questi quattordici dei che permettono di \"bere nel mezzo della corrente\" simboleggiano l\'accesso alla conoscenza superiore attraverso la **coscienza elevata** che trascende le acque primordiali caotiche.\n\n## La dualità della giustizia divina\n\nI numerosissimi gruppi (5, 8, 10, 12, 13, 14, 17) che Angelini identifica come regno della giustizia mostrano la **natura duale** di questa caverna. Le \"Figure con Braccia Nascoste\" (Gruppi 12-14) rappresentano coloro che hanno perduto i mezzi mondani: gli \"dei senza mani\" simboleggiano la perdita del lavoro e dei mezzi materiali. Tuttavia, attraverso questa perdita si può raggiungere la **conoscenza superiore** - il sentiero del mistico che guadagna ricchezza spirituale attraverso la rinuncia materiale.\n\n## Il potere magico e la giustizia terrena\n\nI tori su stendardi con l\'ureo (Gruppi 4, 6, 7) che \"danno potere a Osiride in cielo e in terra\" rappresentano il **potere magico** che opera attraverso le forze naturali. Questo può manifestarsi sia come giustizia divina che come **perdita della libertà** attraverso giudizi tribunali terreni. Le \"Divinità Protettive\" (Gruppi 8-11) mostrano come la disciplina morale e l\'ascensione spirituale permettano di giungere alla **conoscenza di sé** attraverso infinite traversie: malattia, infermità, perdite mondane.\n\n## La religione spirituale attraverso l\'avversità\n\n\"Le Anime che escono\" (Gruppo 16) e \"Gli Splendenti\" (Gruppo 19) indicano il risultato positivo del cammino spirituale, mentre \"Colui dal Volto Ripugnante\" (Gruppo 18) avverte dei pericoli della deviazione. La casa rivela come attraverso la **disciplina morale e l\'ascensione spirituale** si possa raggiungere l\'autentica religione spirituale, trasformando le prove in saggezza superiore.\n\n## La nona casa astrologica\n\nQuesta caverna corrisponde alla **nona casa**: la casa della filosofia, religione, legge, studi superiori e lunghi viaggi. Angelini identifica chiaramente questa dimora come regno dell\'**ordine metafisico, religioso, giuridico e mistico**. Qui si manifesta sia la giustizia divina che quella terrena - i tribunali che possono togliere la libertà, ma anche la disciplina morale che conduce alla liberazione spirituale. È la casa dove si accede alla **conoscenza superiore** attraverso l\'esperienza diretta delle prove spirituali, trasformando l\'avversità in saggezza.';

  @override
  String get tenthCavernTitle =>
      'Decima caverna - La caverna del sacro clamore';

  @override
  String get tenthCavernLiteralMeaning =>
      'La Decima Caverna, chiamata **\"La Clamorosa i cui misteri sono sacri\"**, contiene **otto gruppi di divinità** che incarnano i temi dell\'illuminazione divina e della protezione sacra.\n\n![Struttura della decima divisione](decima_divisione.webp)\n\n## Il nome della caverna\n\nIl nome \"La Clamorosa\" si riferisce ai suoni rituali e alle invocazioni sacre che risuonano in questo dominio, mentre \"i cui misteri sono sacri\" sottolinea la natura inviolabile dei segreti divini qui custoditi.\n\n## Differenze tra le fonti antiche\n\nCome per le altre caverne del Libro delle Dodici Caverne, esistono due modalità di rappresentazione:\n\n**Nell\'Osireion di Abydos** (tempio sotterraneo di Seti I): Ogni gruppo è rappresentato con tutte le sue divinità - ad esempio, il primo gruppo mostra otto dei che camminano disposti in due registri, il secondo gruppo mostra otto dee che versano acqua, e così via.\n\n**Nei papiri funerari** (come il British Museum 10.478): Per economia di spazio, ogni gruppo è rappresentato da **una singola figura simbolica** accompagnata da un numero che indica quante divinità rappresenta. Così una singola dea che versa acqua con il numero \"8\" rappresenta l\'intero gruppo delle otto dee.\n\n## Gli Otto Gruppi di Divinità\n\n### Gruppo 1: \"Coloro che appartengono alla luce\"\n**Rappresentazione**: Otto dei che camminano, disposti in due registri (nell\'Osireion).\n**Significato**: Otto divinità solari che garantiscono al defunto di \"vedere Ra al suo sorgere\" e di partecipare alla luminosità divina.\n\n### Gruppo 2: \"Coloro che afferrano\"\n**Rappresentazione**: Otto dee che versano acqua da vasi sormontati da teste di Anubis (nell\'Osireion).\n**Significato**: Otto divinità femminili che \"afferrano\" le anime, garantendo al defunto di \"essere in giubilazione\".\n\n### Gruppo 3: \"L\'Enneade che custodisce coloro che sono nella terra\"\n**Rappresentazione**: Nove dei mummificati distesi su letti rituali.\n**Significato**: Nove guardiani che vegliano sui morti, garantendo \"il respiro della vita sulla terra e nella Necropoli\".\n\n### Gruppo 4: \"L\'Enneade di coloro il cui braccio è nascosto\"\n**Rappresentazione**: Nove dei mummiformi in piedi (nell\'Osireion, otto dei che sputano acqua).\n**Significato**: Nove divinità con braccia celate che garantiscono al defunto di \"essere glorioso come gli spiriti compiuti\".\n\n### Gruppo 5: \"La Misteriosa\"\n**Rappresentazione**: Una dea in piedi, talvolta con l\'Occhio di Horus (Wedjat).\n**Significato**: Una divinità femminile che fa \"durare l\'anima e prosperare il corpo come quello degli dei nell\'oltretomba\".\n\n### Gruppo 6: \"Le anime degli dei che vennero in essere dalle membra di Osiride\"\n**Rappresentazione**: Trentuno (o ventuno nei papiri) divinità distese, organizzate in gruppi.\n**Significato**: Le anime divine emanate dal corpo di Osiride, che garantiscono \"pace\" al defunto.\n\n### Gruppo 7: \"Gli Adoratori\"\n**Rappresentazione**: Quattro dei che camminano.\n**Significato**: Quattro adoratori di Ra che assicurano che \"non ci sia opposizione al defunto presso nessuna porta dell\'oltretomba\".\n\n### Gruppo 8: \"Coloro dai volti ripugnanti\"\n**Rappresentazione**: Quattro dei che camminano (talvolta rappresentati come una dea).\n**Significato**: Quattro divinità dall\'aspetto terrificante che paradossalmente garantiscono \"refrigerio nel luogo del calore\".';

  @override
  String get tenthCavernEsotericMeaning =>
      '## La caverna della realizzazione mondana e del riconoscimento divino\n\nSecondo Angelini, la Decima Caverna è **associata all\'illuminazione solare** e dimostra come **elevazione e popolarità siano raggiungibili attraverso il sacrificio**, rivelando che la posizione sociale risulta da sforzo sostenuto e favore divino.\n\n## Il clamor sacro e i misteri inviolabili\n\nIl nome \"La Clamorosa i cui misteri sono sacri\" rivela la natura paradossale di questa casa: il **successo pubblico** (il clamore) deve coesistere con la **protezione dei misteri interiori** (il sacro). \"Coloro che appartengono alla luce\" (Gruppo 1) rappresentano l\'illuminazione che deriva dal raggiungimento della posizione sociale e garantiscono di \"vedere Ra al suo sorgere\".\n\n## Il consiglio divino vigilante\n\n\"L\'Enneade che custodisce coloro che sono nella terra\" (Gruppo 3) rappresenta la **supervisione cosmica** che governa il successo mondano. Questi nove guardiani distesi sui letti rituali mostrano come il potere terreno richieda vigilanza costante e protezione divina. Il loro dono del \"respiro della vita\" indica che la vera autorità deriva dall\'allineamento con le forze vitali cosmiche.\n\n## Il paradosso del potere nascosto\n\n\"L\'Enneade di coloro il cui braccio è nascosto\" (Gruppo 4) rivela un insegnamento profondo: il **vero potere si esercita spesso in modo invisibile**. Le braccia celate simboleggiano l\'influenza che opera dietro le quinte, la diplomazia sottile e la saggezza di non mostrare tutte le proprie capacità. Questo gruppo garantisce di essere \"gloriosi come gli spiriti compiuti\", indicando che la vera gloria deriva dalla maestria interiore, non dall\'ostentazione.\n\n## La trasformazione attraverso il sacrificio\n\n\"Le anime degli dei che vennero in essere dalle membra di Osiride\" (Gruppo 6) - trentuno divinità emanate dal corpo smembrato del dio - insegnano che il **successo duraturo richiede sacrificio e trasformazione**. Come Osiride fu smembrato e ricomposto, così chi aspira al potere deve essere disposto a sacrificare parti di sé per rinascere in una forma più elevata. Il numero 31 (o 21) suggerisce i giorni del mese lunare, indicando i cicli di ascesa e discesa nel potere.\n\n## Il refrigerio nel luogo del calore\n\n\"Coloro dai volti ripugnanti\" (Gruppo 8) che paradossalmente garantiscono \"refrigerio nel luogo del calore\" rivelano una verità profonda: le **sfide più difficili** (i volti ripugnanti) nel raggiungere e mantenere il potere possono portare il maggior sollievo e soddisfazione. Il \"luogo del calore\" rappresenta la pressione e lo stress delle posizioni elevate, mentre il \"refrigerio\" è la pace interiore che deriva dal superare tali prove.\n\n## La decima casa astrologica\n\nQuesta caverna corrisponde alla **decima casa**: la casa della carriera, reputazione, status pubblico e realizzazione sociale. Rappresenta il **culmine delle ambizioni terrene** quando allineate con la volontà divina. I gruppi di divinità mostrano che il vero successo richiede: illuminazione (Gruppo 1), capacità di \"afferrare\" le opportunità (Gruppo 2), protezione divina (Gruppo 3), saggezza nascosta (Gruppo 4), mistero personale (Gruppo 5), sacrificio trasformativo (Gruppo 6), devozione (Gruppo 7) e capacità di trasformare le avversità in benedizioni (Gruppo 8).';

  @override
  String get eleventhCavernTitle =>
      'Undicesima caverna - La caverna della protettrice degli stanchi';

  @override
  String get eleventhCavernLiteralMeaning =>
      'L\'Undicesima Caverna, chiamata **\"Colei che copre lo Stanco, che nasconde ciò che è celato\"**, contiene **diciotto gruppi di divinità** che incarnano temi di protezione, rigenerazione e sostegno spirituale.\n\n![Struttura dell\'undicesima divisione](undicesima_divisione.webp)\n\n## Il nome della caverna\n\nIl nome rivela la natura protettiva di questa dimora: \"Colei che copre lo Stanco\" si riferisce alla cura divina per coloro che sono stanchi dal viaggio spirituale, mentre \"che nasconde ciò che è celato\" indica la protezione dei misteri sacri.\n\n## Differenze tra le fonti antiche\n\nCome nelle altre caverne:\n\n**Nell\'Osireion di Abydos**: Ogni gruppo è mostrato con tutte le sue divinità - ad esempio, il nono gruppo mostra nove sciacalli su stendardi, il decimo gruppo mostra nove dee prostrate in lutto.\n\n**Nei papiri funerari**: Rappresentazione simbolica con una figura per gruppo e un numero indicativo - un singolo sciacallo con \"9\" per rappresentare i nove guardiani.\n\n## I Diciotto Gruppi di Divinità\n\n### Gruppo 1: \"La Divoratrice\"\n**Rappresentazione**: Dea in piedi con serpente eretto davanti a lei, numero \"1\".\n**Significato**: Una dea che garantisce \"prosperità, vita, stabilità e ricchezza per il Grande Dio nell\'oltretomba\".\n\n### Gruppo 2: \"L\'Anima dell\'Occidente\"\n**Rappresentazione**: Dio che cammina con scettro, numero \"1\".\n**Significato**: Una divinità che garantisce \"un\'offerta d\'invocazione nella Necropoli\".\n\n### Gruppo 3: \"Le Anime della Terra\"\n**Rappresentazione**: Quattro dei che camminano.\n**Significato**: Quattro divinità che concedono \"tutte le cose pure sulla terra e davanti al Grande Dio\".\n\n### Gruppo 4: \"Coloro che acclamano\"\n**Rappresentazione**: Quattro dei che camminano con braccia alzate.\n**Significato**: Quattro divinità che \"acclamano affinché Osiride si trovi a suo agio tra coloro che sono in cielo\".\n\n### Gruppo 5: \"L\'Enneade del Sovrano dell\'Occidente\"\n**Rappresentazione**: Nove dei mummificati distesi su letti (sui serpenti nell\'Osireion).\n**Significato**: Nove guardiani che vegliano sul regno occidentale dei morti.\n\n### Gruppo 6: \"L\'Enneade al seguito di Ra\"\n**Rappresentazione**: Nove dei mummificati con braccia nascoste, distesi su serpenti e letti.\n**Significato**: Nove divinità che accompagnano Ra nel suo viaggio.\n\n### Gruppo 7: \"Ikh\" (nome criptico)\n**Rappresentazione**: Dio che cammina con scettro, numero \"1\".\n**Significato**: Divinità che garantisce di essere \"al fianco del Grande Dio quando attraversa il cielo\".\n\n### Gruppo 8: \"I Vivificatori di Osiride\" (nome incerto)\n**Rappresentazione**: Quattro dei mummiformi in piedi.\n**Significato**: Divinità che danno vita a Osiride.\n\n### Gruppo 9: \"L\'Enneade dei Guardiani\"\n**Rappresentazione**: Nove sciacalli su stendardi (nell\'Osireion).\n**Significato**: Nove guardiani che \"proteggono il risveglio di Osiride affinché non sia mai annientato\".\n\n### Gruppo 10: \"L\'Enneade delle Lamentatrici\"\n**Rappresentazione**: Nove dee prostrate con capelli davanti al viso e mani alzate.\n**Significato**: Nove dee che \"concedono al defunto lo stesso lamento rituale che venne fatto per il dio Osiride\", garantendo gli stessi onori funebri che permisero la resurrezione divina.\n\n### Gruppo 11: \"Il Convocatore\"\n**Rappresentazione**: Dio che cammina con una mano alzata, numero \"1\".\n**Significato**: Divinità che \"convoca Osiride davanti a Ra presso la sua enneade\".\n\n### Gruppo 12: \"Iqeheren\" (nome divino)\n**Rappresentazione**: Dio che cammina con scettro, numero \"1\".\n**Significato**: Divinità che \"scaccia ogni male da Osiride per sempre\".\n\n### Gruppo 13: \"Testa Sacra\"\n**Rappresentazione**: Cobra con spire e testa di donna, numero \"1\".\n**Significato**: Serpente sacro che \"aiuta Osiride ad avere potere sulle acque\".\n\n### Gruppo 14: \"Coloro che sono nella Testa Sacra\"\n**Rappresentazione**: Tre dei mummiformi in piedi (quattro nell\'Osireion).\n**Significato**: Divinità che \"aiutano Osiride a entrare e uscire liberamente, a muoversi come Signore dell\'oltretomba\".\n\n### Gruppo 15: \"L\'Avvolgitrice\"\n**Rappresentazione**: Cobra con spire, numero \"1\".\n**Significato**: Serpente che avvolge e protegge.\n\n### Gruppo 16: \"Coloro che sono nell\'Avvolgitrice\"\n**Rappresentazione**: Quattro dei che camminano.\n**Significato**: Divinità che permettono di \"camminare senza ostacoli nel luogo sacro\".\n\n### Gruppo 17: \"L\'Enneade di coloro che nascondono Osiride\"\n**Rappresentazione**: Nove dei inginocchiati che guardano indietro (nell\'Osireion), dea prostrata che guarda indietro (nei papiri).\n**Significato**: Nove divinità che \"garantiscono che Osiride sia felice nel luogo che desidera\".\n\n### Gruppo 18: \"Volto Feroce\"\n**Rappresentazione**: Dio mummiforme in piedi, numero \"1\".\n**Significato**: Divinità che \"apre gli occhi a Osiride perché possa vedere la luce di Ra\".';

  @override
  String get eleventhCavernEsotericMeaning =>
      '## La caverna dell\'amicizia spirituale\n\nSecondo Angelini, l\'Undicesima Caverna **\"Colei che copre lo Stanco, che nasconde ciò che è celato\"** rivela le sue **caratteristiche amichevoli** mentre abbraccia sia le **gioie che i dolori che le amicizie possono portare** nei domini sia materiali che spirituali.\n\n## Il sostegno divino e la protezione dell\'anima stanca\n\nIl nome della caverna rivela il suo ruolo fondamentale: \"Colei che copre lo Stanco\" si riferisce alla **protezione divina per l\'anima affaticata** dal lungo viaggio spirituale. \"La Divoratrice\" (Gruppo 1) e \"L\'Anima dell\'Occidente\" (Gruppo 2) rappresentano le forze che **accolgono e sostengono** chi ha bisogno di riposo e rigenerazione. \"Coloro che acclamano\" (Gruppo 4) mostrano la **compagnia celeste** che incoraggia l\'anima verso la pace.\n\n## La rigenerazione attraverso il lamento sacro\n\n\"L\'Enneade delle Lamentatrici\" (Gruppo 10) e \"L\'Enneade dei Guardiani\" (Gruppo 9) rivelano un aspetto profondo: il **potere rigenerativo del dolore condiviso**. Come le dee piangono per Osiride garantendo la sua resurrezione, così le amicizie autentiche attraversano insieme le prove, trasformando la sofferenza in forza spirituale. I nove sciacalli su stendardi \"proteggono il risveglio\" mostrando come i veri amici veglino sulla nostra rinascita spirituale.\n\n## I serpenti dell\'Avvolgitrice: protezione e trasformazione\n\n\"L\'Avvolgitrice\" (Gruppo 15) e \"Coloro che sono nell\'Avvolgitrice\" (Gruppo 16) mostrano come le **costrizioni apparenti** possano diventare protezione. Come il serpente Mehen che avvolge Osiride per proteggerlo, così le limitazioni imposte dalle amicizie autentiche diventano mezzi di crescita spirituale.\n\n## Benefici materiali e spirituali\n\nAngelini specifica che questa caverna governa **\"situazioni finanziarie dipendenti dall\'influenza di protezioni e lasciti da parte di amici, o per colpi di fortuna\"**. I gruppi protettivi mostrano come le amicizie spirituali si manifestino concretamente: \"Le Anime della Terra\" (Gruppo 3) concedono \"cose pure\", mentre \"Il Convocatore\" (Gruppo 11) riunisce le persone giuste al momento giusto.\n\n## L\'undicesima casa astrologica\n\nQuesta caverna corrisponde all\'**undicesima casa**: la casa dell\'amicizia, speranze, desideri e **profondi interessi scientifici e filosofici**. Attraverso le amicizie autentiche l\'anima può raggiungere livelli superiori di comprensione, passando dalle prove condivise (i lamenti) alla libertà spirituale fino alla protezione trasformativa (l\'Avvolgitrice).';

  @override
  String get twelfthCavernTitle =>
      'Dodicesima caverna - La caverna dell\'ultima riva';

  @override
  String get twelfthCavernLiteralMeaning =>
      'La Dodicesima Caverna, chiamata **\"Colei che unisce gli dei e abbraccia le loro manifestazioni\"**, contiene **nove gruppi di divinità** organizzati intorno al tema della riva sacra come confine finale dell\'oltretomba.\n\n![Struttura della dodicesima divisione](dodicesima_divisione.webp)\n\n## I Nove Gruppi di Divinità\n\n### Gruppi 1-2, 4-6: Le Divinità della Riva\n\n**Gruppo 1: \"Colui che controlla la riva\"** - Una divinità che cammina con scettro, che garantisce al defunto di essere \"Signore dell\'Isola dei Giusti\".\n\n**Gruppo 2: \"Gli dei che sono sulla riva dell\'oltretomba\"** - Tredici divinità (nell\'Osireion) rappresentate simbolicamente da una figura nei papiri, che concedono \"verità nella Grande Sala delle Due Verità\".\n\n**Gruppo 4: \"Gli dei che appartengono alla riva\"** - Quattro divinità mummificate che \"danno un\'isola nei Campi di Iaru\".\n\n**Gruppo 5: \"Il Capo della riva\"** - Una divinità con scettro che concede \"una dotazione nel Campo delle Offerte\".\n\n**Gruppo 6: \"Gli dei che sono sulla riva\"** - Otto divinità (quattro nei papiri) che garantiscono \"offerte, cibo e grande quantità di carne nella Necropoli\".\n\n### Gruppo 7: Le Teste Misteriose\n\n**\"Le Teste Misteriose sulla riva\"** - Undici teste d\'ariete montate su bastoni (nell\'Osireion), rappresentate simbolicamente da una singola testa nei papiri. Concedono \"la loro protezione come viene fatto per Colui-dal-Cuore-Stanco\".\n\n### Gruppi 3 e 8: Le Figure nelle Spire\n\n**Gruppo 3: \"Gli dei che sono nel seguito dell\'Avvolgitore\"** - Quattordici divinità distese avvolte dalle spire di serpenti (nell\'Osireion), che garantiscono al defunto di \"essere in qualunque luogo il suo Ka desideri\".\n\n**Gruppo 8: \"Gli dei che sono nelle spire\"** - Quattordici divinità similmente avvolte, che concedono \"la vista del Disco Solare\".\n\n### Gruppo 9: I Reverenti\n\n**Gruppo 9: \"iwwtyw\"** (nome criptico) - Quattro divinità inchinate che garantiscono \"riposo nel bell\'Occidente\".';

  @override
  String get twelfthCavernEsotericMeaning =>
      '## La caverna della riva ultima dove termina la domificazione\n\nSecondo Angelini, **\"Con la XII Caverna si giunge al termine della domificazione, si giunge alla spiaggia oltre il quale esiste il mare\"**. Questa dimora rappresenta **\"la fine della domificazione, la chiusura di questo circuito subliminale\"**, paragonata poeticamente a **\"una spiaggia su cui bisogna arrestarsi\"**.\n\n## I grandi viaggi oltre la spiaggia\n\nAngelini specifica che **\"La Dodicesima Casa con le prime vignette indica la fine della domificazione, ma anche i grandi viaggi, i soggiorni oltre la spiaggia\"** - viaggi che non sono limitati alla nona casa ma si estendono oltre i confini dell\'esperienza terrena. Le **Divinità della Riva** (\"Colui che controlla la spiaggia\", \"Il Capo della spiaggia\", \"Gli dei che sono sulla spiaggia\") governano questo confine ultimo dove l\'individuale incontra l\'infinito.\n\n## La Misteriosa Testa sulla spiaggia: spiritualità e sofferenza\n\nLa **\"Misteriosa Testa sulla spiaggia\"** (Gruppo 7) - **\"una testa di ariete posta su di una pertica\"** - rivela secondo Angelini **\"la spiritualità di questa casa, ma anche, e soprattutto, la sua parte negativa, intessuta di sofferenza, di legami ineluttabili, di costrizioni\"**.\n\n## Le spire costrittive e il paradosso della liberazione\n\nIl tratto distintivo della dodicesima casa è la sua **\"funzione costrittiva, immobilizzante, con le molte spire del serpente che intrappolano il dio\"**. I **\"Dei che sono nel seguito dell\'Avvolgitore\"** e **\"Gli dei che sono nelle spire\"** (Gruppi 3 e 8) mostrano figure divine **\"avviluppate dalle spire di un serpente\"**, rappresentando coloro che sono **\"immobilizzati dalle circostanze esterne ed interne\"**.\n\nTuttavia, come Angelini osserva nel contesto generale del Libro delle Caverne, le costrizioni apparenti possono diventare mezzi di liberazione spirituale. Le spire che immobilizzano sono anche quelle che proteggono, seguendo il modello di Mehen, il grande serpente che avvolge Osiride per custodirlo nel suo viaggio di rigenerazione.\n\n## La dodicesima casa astrologica\n\nQuesta caverna corrisponde alla **dodicesima casa**: il dominio delle realtà nascoste, del sacrificio spirituale e della trascendenza ultima. È il luogo dove **\"termina il Neter Kether\"** (il mondo nascosto) e dove la domificazione terrena cede il passo all\'infinito mare dell\'esistenza trascendente, raggiunto paradossalmente attraverso l\'accettazione delle costrizioni finali.';

  @override
  String get codexSubtitle =>
      'La tua porta di accesso alla conoscenza astrologica';

  @override
  String get privacyPolicyTitle => 'Privacy Policy di AstroGods';

  @override
  String get privacyPolicyWelcomeText =>
      'Benvenuto nella privacy policy di AstroGods. Questa policy ti aiuterà a comprendere quali dati raccogliamo, perché li raccogliamo e quali sono i tuoi diritti in merito.';

  @override
  String get lastModified => 'Ultima modifica: 7 settembre 2025';

  @override
  String get summary => 'Sommario';

  @override
  String get summarySection => 'Riepilogo';

  @override
  String get dataControllerSection => 'Titolare del Trattamento dei Dati';

  @override
  String get dataTypesSection => 'Tipologie di Dati raccolti';

  @override
  String get processingMethodsSection => 'Modalità e luogo del trattamento';

  @override
  String get purposesSection => 'Finalità del Trattamento';

  @override
  String get processingDetailsSection => 'Dettagli sul trattamento';

  @override
  String get cookiePolicySection => 'Cookie Policy';

  @override
  String get euInfoSection => 'Ulteriori informazioni UE';

  @override
  String get additionalInfoSection => 'Ulteriori informazioni';

  @override
  String get definitionsSection => 'Definizioni e riferimenti legali';

  @override
  String get dataControllerName => 'Arcangelo Massari - Bologna (Italia)';

  @override
  String get dataControllerEmailLabel => 'Indirizzo email del Titolare: ';

  @override
  String get dataControllerEmail => 'contact@astrogods.it';

  @override
  String get dataWeCollectAutomatically =>
      'Dati che raccogliamo automaticamente';

  @override
  String get dataWeCollectAutomaticallyDesc =>
      'Raccogliamo automaticamente i tuoi dati, ad esempio quando visiti AstroGods.';

  @override
  String get dataYouProvide => 'Dati che ci fornisce';

  @override
  String get dataYouProvideDesc =>
      'Raccogliamo i dati che ci fornisci, ad esempio quando crei un account su AstroGods.';

  @override
  String get trustedThirdParties =>
      'Terze parti affidabili che ci aiutano a trattarli';

  @override
  String get howWeUseThem => 'Come li usiamo';

  @override
  String get usageData => 'dati di utilizzo';

  @override
  String get ipAddress => 'indirizzo ip';

  @override
  String get deviceInformation => 'informazioni sul dispositivo';

  @override
  String get trackingTools => 'strumenti di tracciamento';

  @override
  String get name => 'nome';

  @override
  String get surname => 'cognome';

  @override
  String get gender => 'sesso';

  @override
  String get billingAddress => 'indirizzo di fatturazione';

  @override
  String get paymentInformation => 'informazioni di pagamento';

  @override
  String get purchaseHistory => 'cronologia acquisti';

  @override
  String get registrationAndAuth => 'Registrazione ed autenticazione';

  @override
  String get hostingAndBackend => 'Hosting ed infrastruttura backend';

  @override
  String get trafficOptimization =>
      'Ottimizzazione e distribuzione del traffico';

  @override
  String get statistics => 'Statistica';

  @override
  String get backendApi => 'Backend API';

  @override
  String get paymentManagement => 'Gestione dei pagamenti';

  @override
  String get dataTypesIntro =>
      'Fra i Dati Personali raccolti da AstroGods, in modo autonomo o tramite terze parti, ci sono:';

  @override
  String get communicatedDataDuringService =>
      'dati comunicati durante l\'utilizzo del servizio';

  @override
  String get inCaseOfProblems => 'In caso di problemi';

  @override
  String get problemsDescription =>
      'Benché ci impegniamo a creare un\'esperienza utente positiva, sappiamo che occasionalmente possono verificarsi problemi tra noi e i nostri utenti.';

  @override
  String get doNotHesitateContact => 'In tal caso, non esitare a contattarci.';

  @override
  String get contactUs => 'Contattaci';

  @override
  String get cookiePolicy => 'Cookie Policy';

  @override
  String get termsAndConditions => 'Termini e Condizioni';

  @override
  String get dataTypesDetailedContent =>
      'Dettagli completi su ciascuna tipologia di Dati Personali raccolti sono forniti nelle sezioni dedicate di questa privacy policy o mediante specifici testi informativi visualizzati prima della raccolta dei Dati stessi.\n\nI Dati Personali possono essere liberamente forniti dall\'Utente o, nel caso di Dati di Utilizzo, raccolti automaticamente durante l\'uso di AstroGods.\n\nSe non diversamente specificato, tutti i Dati richiesti da AstroGods sono obbligatori. Se l\'Utente rifiuta di comunicarli, potrebbe essere impossibile per AstroGods fornire il Servizio. Nei casi in cui AstroGods indichi alcuni Dati come facoltativi, gli Utenti sono liberi di astenersi dal comunicare tali Dati, senza che ciò abbia alcuna conseguenza sulla disponibilità del Servizio o sulla sua operatività.\n\nGli Utenti che dovessero avere dubbi su quali Dati siano obbligatori sono incoraggiati a contattare il Titolare.\n\nL\'eventuale utilizzo di Cookie - o di altri strumenti di tracciamento - da parte di AstroGods o dei titolari dei servizi terzi utilizzati da AstroGods ha la finalità di fornire il Servizio richiesto dall\'Utente, oltre alle ulteriori finalità descritte nel presente documento e nella Cookie Policy.\n\nL\'Utente si assume la responsabilità dei Dati Personali di terzi ottenuti, pubblicati o condivisi mediante AstroGods.';

  @override
  String get purposesIntroText =>
      'I Dati dell\'Utente sono raccolti per consentire al Titolare di fornire il Servizio, adempiere agli obblighi di legge, rispondere a richieste o azioni esecutive, tutelare i propri diritti ed interessi (o quelli di Utenti o di terze parti), individuare eventuali attività dolose o fraudolente, nonché per le seguenti finalità:';

  @override
  String get purposesDetailedInfoText =>
      'Per ottenere informazioni dettagliate sulle finalità del trattamento e sui Dati Personali concretamente rilevanti per ciascuna finalità, l\'Utente può fare riferimento alla sezione \"Dettagli sul trattamento dei Dati Personali\".';

  @override
  String get processingMethodsTitle =>
      'Modalità e luogo del trattamento dei Dati raccolti';

  @override
  String get processingMethodsContent =>
      '### Modalità di trattamento\n\nIl Titolare tratta i Dati Personali degli Utenti adottando le opportune misure di sicurezza volte ad impedire l\'accesso, la divulgazione, la modifica o la distruzione non autorizzate dei Dati Personali.\n\nIl trattamento viene effettuato mediante strumenti informatici e/o telematici, con modalità organizzative e con logiche strettamente correlate alle finalità indicate. Oltre al Titolare, in alcuni casi, potrebbero avere accesso ai Dati altri soggetti coinvolti nell\'organizzazione di AstroGods (personale amministrativo, commerciale, marketing, legali, amministratori di sistema) ovvero soggetti esterni (come fornitori di servizi tecnici terzi, corrieri postali, hosting provider, società informatiche, agenzie di comunicazione) nominati anche, se necessario, Responsabili del Trattamento da parte del Titolare. L\'elenco aggiornato dei Responsabili potrà sempre essere richiesto al Titolare del Trattamento.\n\n### Luogo\n\nI Dati sono trattati presso le sedi operative del Titolare ed in ogni altro luogo in cui le parti coinvolte nel trattamento siano localizzate.\n\nPer ulteriori informazioni, contatta il Titolare.\n\nI Dati Personali dell\'Utente potrebbero essere trasferiti in un paese diverso da quello in cui l\'Utente si trova. Per ottenere ulteriori informazioni sul luogo del trattamento l\'Utente può fare riferimento alla sezione relativa ai dettagli sul trattamento dei Dati Personali.\n\n### Tempo di conservazione\n\nSalvo quanto diversamente specificato in questo documento, i Dati Personali sono trattati e conservati per il tempo richiesto dalle finalità per le quali sono stati raccolti e potrebbero essere conservati per un periodo più lungo a causa di eventuali obbligazioni legali o sulla base del consenso degli Utenti.';

  @override
  String get cookiePolicyTitle => 'Cookie Policy';

  @override
  String get cookiePolicyContent =>
      'AstroGods fa utilizzo di Strumenti di Tracciamento. Per saperne di più, consulta la Cookie Policy.';

  @override
  String get euInfoTitle =>
      'Ulteriori informazioni per gli utenti dell\'Unione Europea';

  @override
  String get euInfoContent =>
      'Questa sezione si applica a tutti gli utenti dell\'Unione Europea, in conformità al Regolamento generale sulla protezione dei dati (il \"GDPR\") e, per tali Utenti, sostituisce qualsiasi altra informazione eventualmente divergente o in conflitto contenuta nell\'informativa sulla privacy.\n\nUlteriori dettagli relativi alle categorie di Dati trattati, alle finalità del trattamento, alle categorie di destinatari dei Dati personali, se presenti, e ulteriori informazioni sui Dati personali sono disponibili nella sezione \"Dettagli sul trattamento dei Dati Personali\" all\'interno del presente documento.';

  @override
  String get paymentManagementTitle => 'Gestione dei pagamenti';

  @override
  String get paymentManagementDescription =>
      'Se non diversamente specificato, AstroGods elabora tutti i pagamenti con carta di credito, bonifico bancario o altri mezzi tramite fornitori esterni di servizi di pagamento. In generale, e salvo diversa indicazione, gli Utenti sono pregati di fornire i dettagli di pagamento e le informazioni personali direttamente a tali fornitori di servizi di pagamento.\nAstroGods non è coinvolta nella raccolta e nell\'elaborazione di tali informazioni: riceverà invece solo una notifica da parte del fornitore di servizi di pagamento in questione circa l\'avvenuto pagamento.';

  @override
  String get hostingBackendTitle => 'Hosting ed infrastruttura backend';

  @override
  String get hostingBackendDescription =>
      'Questo tipo di servizi ha la funzione di ospitare Dati e file che permettono a AstroGods di funzionare, ne consentono la distribuzione e mettono a disposizione un\'infrastruttura pronta all\'uso per erogare specifiche funzionalità di AstroGods.\n\nAlcuni servizi tra quelli elencati di seguito, se presenti, possono funzionare su server geograficamente distribuiti, rendendo difficile determinare l\'effettiva ubicazione in cui sono conservati i Dati Personali.';

  @override
  String get backendApiTitle => 'Backend API';

  @override
  String get backendApiDescription =>
      'AstroGods utilizza API di terze parti per elaborare richieste degli utenti e fornire contenuti personalizzati.';

  @override
  String get authenticationTitle => 'Registrazione ed autenticazione';

  @override
  String get authenticationDescription =>
      'Registrando o autenticando, gli Utenti consentono a AstroGods di identificarli e dar loro accesso a servizi dedicati.\nA seconda di quanto indicato di seguito, i servizi di terze parti potrebbero fornire una registrazione e autenticazione semplificata.';

  @override
  String get trafficOptimizationTitle =>
      'Ottimizzazione e distribuzione del traffico';

  @override
  String get trafficOptimizationDescription =>
      'Questo tipo di servizi permette a AstroGods di distribuire i propri contenuti tramite una rete di server distribuiti geograficamente e di ottimizzare le sue prestazioni.\nI Dati Personali trattati dipendono dalle caratteristiche e dalla modalità d\'uso di questi servizi, la cui funzione è quella di filtrare le comunicazioni fra AstroGods e il browser dell\'Utente.\nData la natura distribuita di questo sistema, è difficile determinare i luoghi in cui vengono trasferiti i contenuti che potrebbero contenere Dati Personali dell\'Utente.';

  @override
  String get stripeDescription =>
      'Stripe è un servizio di pagamento fornito da Stripe Technology Europe Ltd.';

  @override
  String get hetznerDescription =>
      'Hetzner è un servizio di hosting fornito da Hetzner Online GmbH.';

  @override
  String get godaddyDescription =>
      'GoDaddy Web Hosting è un servizio di hosting fornito da GoDaddy.com, LLC.';

  @override
  String get anthropicApiDescription =>
      'L\'API di Anthropic è un servizio di intelligenza artificiale fornito da Anthropic PBC.';

  @override
  String get googleOAuthDescription =>
      'Google OAuth è un servizio di autenticazione fornito da Google Inc.';

  @override
  String get googleFontsDescription =>
      'Google Fonts è un servizio di web font fornito da Google Inc.';

  @override
  String get europeanUnion => 'Unione europea';

  @override
  String get germany => 'Germania';

  @override
  String get unitedStates => 'Stati Uniti';

  @override
  String get ireland => 'Irlanda';

  @override
  String get italy => 'Italia';

  @override
  String get statisticsTitle => 'Statistica';

  @override
  String get statisticsDescription =>
      'I servizi contenuti nella presente sezione permettono al Titolare del Trattamento di monitorare e analizzare i dati di traffico e servono a tener traccia del comportamento dell\'Utente.';

  @override
  String get matomatoDescription =>
      'Matomo è un software di statistica utilizzato da AstroGods per analizzare i dati in maniera diretta e senza l\'ausilio di terzi.';

  @override
  String get directRegistration => 'Registrazione diretta';

  @override
  String get directRegistrationDescription =>
      'L\'Utente si registra compilando il modulo di registrazione e fornendo direttamente a AstroGods i propri Dati Personali.';

  @override
  String get euExtendedContent =>
      '### Base giuridica del trattamento\n\nIl Titolare può trattare i Dati Personali dell\'Utente, se sussiste una delle seguenti condizioni:\n\n- l\'Utente ha prestato il consenso per una o più finalità specifiche;\n- il trattamento è necessario all\'esecuzione di un contratto con l\'Utente e/o all\'esecuzione di misure precontrattuali;\n- il trattamento è necessario per adempiere un obbligo legale al quale è soggetto il Titolare;\n- il trattamento è necessario per l\'esecuzione di un compito di interesse pubblico o per l\'esercizio di pubblici poteri di cui è investito il Titolare;\n- il trattamento è necessario per il perseguimento del legittimo interesse del Titolare o di terzi.\n\nÈ comunque sempre possibile richiedere al Titolare di chiarire la concreta base giuridica di ciascun trattamento ed in particolare di specificare se il trattamento sia basato sulla legge, previsto da un contratto o necessario per concludere un contratto.\n\n### Ulteriori informazioni sui tempi di conservazione\n\nSe non diversamente indicato in questo documento, i Dati Personali sono trattati e conservati per il tempo richiesto dalla finalità per la quale sono stati raccolti e potrebbero essere conservati per un periodo più lungo a causa di eventuali obbligazioni legali o sulla base del consenso degli Utenti.\n\nPertanto:\n\n- I Dati Personali raccolti per scopi collegati all\'esecuzione di un contratto tra il Titolare e l\'Utente saranno trattenuti sino a quando sia completata l\'esecuzione di tale contratto.\n- I Dati Personali raccolti per finalità riconducibili all\'interesse legittimo del Titolare saranno trattenuti sino al soddisfacimento di tale interesse. L\'Utente può ottenere ulteriori informazioni in merito all\'interesse legittimo perseguito dal Titolare nelle relative sezioni di questo documento o contattando il Titolare.\n\nQuando il trattamento è basato sul consenso dell\'Utente, il Titolare può conservare i Dati Personali più a lungo sino a quando detto consenso non venga revocato. Inoltre, il Titolare potrebbe essere obbligato a conservare i Dati Personali per un periodo più lungo in ottemperanza ad un obbligo di legge o per ordine di un\'autorità.\n\nAllo scadere del periodo di conservazione i Dati Personali saranno cancellati. Pertanto, allo scadere di tale periodo il diritto di accesso, cancellazione, rettificazione ed il diritto alla portabilità dei Dati non potranno più essere esercitati.\n\n### Diritti dell\'Utente sulla base del Regolamento Generale sulla Protezione dei Dati (GDPR)\n\nGli Utenti possono esercitare determinati diritti con riferimento ai Dati trattati dal Titolare.\n\nIn particolare, l\'Utente ha il diritto di:\n\n- **revocare il consenso in ogni momento**. L\'Utente può revocare il consenso al trattamento dei propri Dati Personali precedentemente espresso.\n- **opporsi al trattamento dei propri Dati**. L\'Utente può opporsi al trattamento dei propri Dati quando esso avviene su una base giuridica diversa dal consenso.\n- **accedere ai propri Dati**. L\'Utente ha il diritto di ottenere informazioni sui Dati trattati dal Titolare, su determinati aspetti del trattamento, nonché di ottenere una copia dei Dati trattati.\n- **verificare e chiedere la rettificazione**. L\'Utente può verificare la correttezza dei propri Dati e richiederne l\'aggiornamento o la correzione.\n- **ottenere la limitazione del trattamento**. L\'Utente può chiedere la limitazione del trattamento dei propri Dati. In tal caso il Titolare non tratterà i Dati per alcun altro scopo se non la loro conservazione.\n- **ottenere la cancellazione o rimozione dei propri Dati Personali**. L\'Utente può chiedere la cancellazione dei propri Dati da parte del Titolare.\n- **ricevere i propri Dati o farli trasferire ad altro titolare**. L\'Utente ha il diritto di ricevere i propri Dati in formato strutturato, di uso comune e leggibile da dispositivo automatico e, ove tecnicamente fattibile, di ottenerne il trasferimento senza ostacoli ad un altro titolare.\n- **proporre reclamo**. L\'Utente può proporre un reclamo all\'autorità di controllo della protezione dei dati personali competente o agire in sede giudiziale.\n\nGli Utenti hanno diritto di ottenere informazioni in merito alla base giuridica per il trasferimento di Dati all\'estero incluso verso qualsiasi organizzazione internazionale regolata dal diritto internazionale o costituita da due o più paesi, come ad esempio l\'ONU, nonché in merito alle misure di sicurezza adottate dal Titolare per proteggere i loro Dati.\n\n### Dettagli sul diritto di opposizione\n\nQuando i Dati Personali sono trattati nell\'interesse pubblico, nell\'esercizio di pubblici poteri di cui è investito il Titolare oppure per perseguire un interesse legittimo del Titolare, gli Utenti hanno diritto ad opporsi al trattamento per motivi connessi alla loro situazione particolare.\n\nSi fa presente agli Utenti che, ove i loro Dati fossero trattati con finalità di marketing diretto, possono opporsi al trattamento in qualsiasi momento, gratuitamente e senza fornire alcuna motivazione. Qualora gli Utenti si oppongano al trattamento per finalità di marketing diretto, i Dati Personali non sono più oggetto di trattamento per tali finalità. Per scoprire se il Titolare tratti Dati con finalità di marketing diretto gli Utenti possono fare riferimento alle relative sezioni di questo documento.\n\n### Come esercitare i diritti\n\nEventuali richieste di esercizio dei diritti dell\'Utente possono essere indirizzate al Titolare attraverso i recapiti forniti in questo documento. La richiesta è gratuita e il Titolare risponderà nel più breve tempo possibile, in ogni caso entro un mese, fornendo all\'Utente tutte le informazioni previste dalla legge. Eventuali rettifiche, cancellazioni o limitazioni del trattamento saranno comunicate dal Titolare a ciascuno dei destinatari, se esistenti, a cui sono stati trasmessi i Dati Personali, salvo che ciò si riveli impossibile o implichi uno sforzo sproporzionato. Il Titolare comunica all\'Utente tali destinatari qualora egli lo richieda.';

  @override
  String get additionalInfoContent =>
      '### Difesa in giudizio\n\nI Dati Personali dell\'Utente possono essere utilizzati da parte del Titolare in giudizio o nelle fasi preparatorie alla sua eventuale instaurazione per la difesa da abusi nell\'utilizzo di AstroGods o dei Servizi connessi da parte dell\'Utente.\n\nL\'Utente dichiara di essere consapevole che il Titolare potrebbe essere obbligato a rivelare i Dati per ordine delle autorità pubbliche.\n\n### Informative specifiche\n\nSu richiesta dell\'Utente, in aggiunta alle informazioni contenute in questa privacy policy, AstroGods potrebbe fornire all\'Utente delle informative aggiuntive e contestuali riguardanti Servizi specifici, o la raccolta ed il trattamento di Dati Personali.\n\n### Log di sistema e manutenzione\n\nPer necessità legate al funzionamento ed alla manutenzione, AstroGods e gli eventuali servizi terzi da essa utilizzati potrebbero raccogliere log di sistema, ossia file che registrano le interazioni e che possono contenere anche Dati Personali, quali l\'indirizzo IP dell\'Utente.\n\n### Informazioni non contenute in questa policy\n\nMaggiori informazioni in relazione al trattamento dei Dati Personali potranno essere richieste in qualsiasi momento al Titolare del Trattamento utilizzando gli estremi di contatto.\n\nPer scoprire se gli eventuali servizi di terze parti utilizzati le supportino, l\'Utente è invitato a consultare le rispettive privacy policy.\n\n### Modifiche a questa privacy policy\n\nIl Titolare del Trattamento si riserva il diritto di apportare modifiche alla presente privacy policy in qualunque momento notificandolo agli Utenti su questa pagina e, se possibile, su AstroGods nonché, qualora tecnicamente e legalmente fattibile, inviando una notifica agli Utenti attraverso uno degli estremi di contatto di cui è in possesso. Si prega dunque di consultare con frequenza questa pagina, facendo riferimento alla data di ultima modifica indicata in fondo.\n\nQualora le modifiche interessino trattamenti la cui base giuridica è il consenso, il Titolare provvederà a raccogliere nuovamente il consenso dell\'Utente, se necessario.';

  @override
  String get definitionsContent =>
      'Termini chiave e relativi significati utilizzati in questo documento';

  @override
  String get errorOpeningUrl => 'Errore nell\'aprire l\'URL';

  @override
  String get providedByLabel => 'Servizio fornito da: ';

  @override
  String get cookiePolicyPageTitle => 'Cookie Policy';

  @override
  String get cookiePolicyWelcomeText =>
      'Questa pagina spiega come utilizziamo i cookie e le tecnologie di tracciamento per migliorare la tua esperienza.';

  @override
  String get whatAreCookiesSection => 'Cosa sono i cookie?';

  @override
  String get whatAreCookiesContent =>
      'I cookie sono piccoli file di dati che vengono memorizzati sul tuo computer o dispositivo mobile quando visiti un sito web. Sono ampiamente utilizzati per far funzionare i siti web in modo più efficiente, fornire una migliore esperienza utente e fornire informazioni di reporting.';

  @override
  String get typesOfCookiesSection => 'Tipi di cookie che utilizziamo';

  @override
  String get necessaryCookiesTitle => 'Cookie necessari';

  @override
  String get necessaryCookiesDescription =>
      'Questi cookie sono essenziali per il corretto funzionamento del sito web. Abilitano funzionalità di base come sicurezza, gestione della rete e accessibilità.';

  @override
  String get measurementCookiesTitle => 'Cookie di misurazione';

  @override
  String get measurementCookiesDescription =>
      'Questi cookie ci aiutano a capire come i visitatori interagiscono con il nostro sito web raccogliendo e riportando informazioni in modo anonimo.';

  @override
  String get trackingToolsSection => 'Strumenti di tracciamento';

  @override
  String get trackingToolsIntro =>
      'AstroGods utilizza i seguenti strumenti di tracciamento:';

  @override
  String get matomoSelfHostedTitle => 'Matomo (self-hosted)';

  @override
  String get matomoSelfHostedDescription =>
      'Utilizziamo Matomo, una piattaforma di analisi incentrata sulla privacy ospitata sui nostri server. Ciò significa che i tuoi dati non lasciano mai la nostra infrastruttura e non vengono condivisi con terze parti. Matomo ci aiuta a capire come gli utenti interagiscono con il nostro servizio rispettando la tua privacy.';

  @override
  String get dataCollectedByMatomo => 'Dati raccolti da Matomo:';

  @override
  String get managingCookiesSection => 'Gestione dei cookie';

  @override
  String get managingCookiesContent =>
      'Hai il controllo sui cookie che utilizziamo. Puoi gestire le tue preferenze attraverso le impostazioni del browser o utilizzando i controlli che forniamo. Tieni presente che la disabilitazione di alcuni cookie potrebbe influire sulla funzionalità del nostro sito web.';

  @override
  String get browserSettingsTitle => 'Impostazioni del browser';

  @override
  String get browserSettingsContent =>
      'La maggior parte dei browser web consente di controllare i cookie attraverso le preferenze delle impostazioni. Puoi impostare il tuo browser per rifiutare i cookie o eliminare determinati cookie. In generale, puoi anche gestire tecnologie simili allo stesso modo.';

  @override
  String get consequencesOfBlockingTitle => 'Conseguenze del blocco dei cookie';

  @override
  String get consequencesOfBlockingContent =>
      'Se scegli di bloccare o eliminare i cookie, alcune funzionalità del nostro sito web potrebbero non funzionare correttamente. Potresti riscontrare funzionalità ridotte e un\'esperienza meno personalizzata.';

  @override
  String get complianceSection => 'Conformità';

  @override
  String get complianceContent =>
      'La nostra cookie policy è conforme agli standard di protezione dei dati dell\'UE. Utilizziamo solo strumenti di tracciamento di prima parte e non condividiamo i tuoi dati con inserzionisti di terze parti.';

  @override
  String get contactForCookiesTitle => 'Contattaci sui cookie';

  @override
  String get contactForCookiesContent =>
      'Se hai domande sul nostro utilizzo di cookie o tecnologie di tracciamento, contattaci:';

  @override
  String get cookiePolicyLastModified => 'Ultima modifica: 7 settembre 2025';

  @override
  String get termsAndConditionsTitle => 'Termini e Condizioni di AstroGods';

  @override
  String get termsIntroduction => 'Introduzione';

  @override
  String get termsOfUse => 'Condizioni d\'uso';

  @override
  String get registration => 'Registrazione';

  @override
  String get registrationRequired =>
      'Per usufruire del Servizio l\'Utente può aprire un account indicando tutti i dati e le informazioni richieste in maniera completa e veritiera. Non è possibile usufruire del Servizio senza aprire un account Utente.';

  @override
  String get accountRequirements => 'Requisiti per la registrazione';

  @override
  String get accountClosureTitle => 'Chiusura account';

  @override
  String get accountSuspension => 'Sospensione e cancellazione account';

  @override
  String get accountSuspensionText =>
      'Il Titolare si riserva il diritto di sospendere o cancellare l\'account di un Utente in qualsiasi momento a propria discrezione e senza preavviso, qualora lo ritenga inopportuno, offensivo o contrario a questi Termini.';

  @override
  String get permittedUse => 'Uso ammesso';

  @override
  String get permittedUseText =>
      'AstroGods ed il Servizio possono essere utilizzati solo per gli scopi per i quali sono offerti, secondo questi Termini ed ai sensi della legge applicabile.';

  @override
  String get salesTerms => 'Termini e condizioni di vendita';

  @override
  String get paidProducts => 'Prodotti a pagamento';

  @override
  String get productDescription => 'Descrizione del prodotto';

  @override
  String get purchaseProcedure => 'Procedura d\'acquisto';

  @override
  String get orderSubmission => 'Invio dell\'ordine';

  @override
  String get pricing => 'Prezzi';

  @override
  String get promotionsAndDiscounts => 'Promozioni e sconti';

  @override
  String get vouchers => 'Buoni';

  @override
  String get paymentMethods => 'Mezzi di pagamento';

  @override
  String get purchaseViaAppStore => 'Acquisto su app store';

  @override
  String get deliveryOfDigitalContent => 'Consegna di contenuti digitali';

  @override
  String get contractDuration => 'Durata del contratto';

  @override
  String get trialPeriod => 'Periodo di prova';

  @override
  String get subscriptions => 'Abbonamenti';

  @override
  String get lifetimeSubscriptions => 'Abbonamenti a vita';

  @override
  String get fixedTermSubscriptions => 'Abbonamenti a tempo determinato';

  @override
  String get automaticRenewal => 'Rinnovo automatico';

  @override
  String get cancellation => 'Risoluzione';

  @override
  String get userRights => 'Diritti dell\'Utente';

  @override
  String get rightOfWithdrawal => 'Diritto di recesso';

  @override
  String get liabilityAndIndemnification =>
      'Limitazione di responsabilità e manleva';

  @override
  String get indemnificationText =>
      'L\'Utente si impegna a manlevare e tenere indenne il Titolare e i suoi sottoposti, affiliati, funzionari, agenti, contitolari del marchio, partner e dipendenti nella misura di legge da qualsivoglia rivendicazione o pretesa – compresi, senza alcuna limitazione, oneri e spese legali – avanzata da terzi a causa di o in collegamento con comportamenti in violazione dei presenti Termini, di diritti di terzi o di legge, posti in essere in collegamento con l\'utilizzo del Servizio e addebitabili all\'Utente, ai suoi affiliati, funzionari, agenti, contitolari del marchio, partner e dipendenti, a titolo di colpa.';

  @override
  String get commonProvisions => 'Disposizioni comuni';

  @override
  String get noWaiverImplied => 'Nessuna rinuncia implicita';

  @override
  String get serviceInterruption => 'Interruzione del Servizio';

  @override
  String get serviceResale => 'Rivendita del Servizio';

  @override
  String get privacyPolicyReference => 'Privacy policy';

  @override
  String get contractAssignment => 'Cessione del contratto';

  @override
  String get contacts => 'Contatti';

  @override
  String get severabilityClause => 'Clausola di salvaguardia';

  @override
  String get applicableLaw => 'Legge applicabile';

  @override
  String get disputeResolution => 'Risoluzione delle controversie';

  @override
  String get definitions => 'Definizioni e riferimenti legali';

  @override
  String get astrologicalServiceNature => 'Natura del servizio astrologico';

  @override
  String get astrologicalServiceDescription =>
      'AstroGods utilizza l\'astrologia come sistema di conoscenza simbolica e strumento di ricerca personale. L\'Utente comprende che:';

  @override
  String get astrologicalServicePoint1 =>
      'L\'Astrologia è un antico sistema di interpretazione basato su correlazioni simboliche, non su causalità scientifiche dimostrabili';

  @override
  String get astrologicalServicePoint2 =>
      'Il servizio offre strumenti per l\'autoesplorazione e la comprensione di sé attraverso il linguaggio astrologico';

  @override
  String get astrologicalServicePoint3 =>
      'Le interpretazioni fornite sono finalizzate alla ricerca interiore e allo sviluppo della consapevolezza personale';

  @override
  String get astrologicalServicePoint4 =>
      'Non viene fornita consulenza professionale di natura medica, psicologica, legale o finanziaria';

  @override
  String get astrologicalServicePoint5 =>
      'Le analisi astrologiche sono strumenti di riflessione e non predicono eventi con certezza assoluta';

  @override
  String get astrologicalServicePoint6 =>
      'L\'Utente è responsabile dell\'uso che fa delle informazioni ricevute nel proprio percorso di crescita personale';

  @override
  String get referralProgram => 'Passaparola';

  @override
  String get termsAcceptanceRequired =>
      'L\'Utente è pregato di leggere attentamente questo documento.';

  @override
  String get ownerName => 'Arcangelo Massari - Bologna (Italia)';

  @override
  String get ownerEmail => 'Indirizzo email del Titolare:';

  @override
  String get termsGovernText => 'Questi Termini disciplinano';

  @override
  String get useOfService => 'l\'utilizzo di AstroGods e';

  @override
  String get legalRelationship =>
      'qualsiasi altro Accordo o rapporto giuridico con il Titolare';

  @override
  String get bindingManner =>
      'in maniera vincolante. Le espressioni con l\'iniziale maiuscola sono definite nella relativa sezione di questo documento.';

  @override
  String get consumerRequirement => 'L\'Utente agisce come Consumatore';

  @override
  String get notUnderEmbargo =>
      'L\'Utente non è situato in un paese soggetto ad embargo governativo da parte degli Stati Uniti d\'America o in un paese inserito nella lista degli stati che sponsorizzano il terrorismo';

  @override
  String get notOnProhibitedList =>
      'L\'Utente non è inserito in alcuna lista di contraenti non ammessi da parte del governo degli Stati Uniti d\'America';

  @override
  String get botRegistrationProhibited =>
      'L\'apertura di account tramite bot o altri mezzi automatizzati non è ammessa.';

  @override
  String get oneAccountPerUser =>
      'Salvo ove diversamente specificato, ciascun Utente può creare un solo account.';

  @override
  String get accountSharingProhibited =>
      'Salvo ove espressamente consentito, l\'account di un Utente non può essere condiviso con altre persone.';

  @override
  String get externalResources => 'Accesso a risorse esterne';

  @override
  String get externalResourcesDisclaimer =>
      'Tramite AstroGods gli Utenti potrebbero avere accesso a risorse fornite da terzi. Gli Utenti riconoscono ed accettano che il Titolare non ha alcun controllo su tali risorse.';

  @override
  String get orderConfirmation =>
      'Una volta inoltrato l\'ordine, agli Utenti sarà inviata una conferma di ricezione dell\'ordine.';

  @override
  String get trialAutoConversion =>
      'Alla scadenza, il periodo di prova si trasformerà automaticamente nell\'equivalente Prodotto a pagamento, a meno che l\'Utente non disdica l\'acquisto prima che il periodo di prova scada.';

  @override
  String get lifetimeRefundPolicy =>
      'Nel caso in cui il Prodotto cessi la sua attività entro un periodo di tempo inferiore a 24 mesi, gli Utenti riceveranno un rimborso.';

  @override
  String get fixedTermSubscriptionText =>
      'Gli abbonamenti a pagamento a tempo determinato decorrono dal giorno in cui il Titolare riceve il pagamento e restano attivi per la durata di abbonamento scelta dall\'Utente.';

  @override
  String get consumerExceptionText =>
      'Tuttavia, a prescindere da quanto precede, se l\'Utente agisce come Consumatore, si applica quanto segue:';

  @override
  String get withdrawalRightSummary =>
      'A meno che non ricorra un\'eccezione, l\'Utente potrebbe godere del diritto di recedere dal contratto entro il termine sotto specificato (di norma 14 giorni) per qualsiasi motivo e senza giustificazione. L\'Utente può trovare ulteriori informazioni sul diritto di recesso in questa sezione.';

  @override
  String get whoHasWithdrawalRights => 'Chi gode del diritto di recesso';

  @override
  String get europeanConsumersWithdrawal =>
      'Ove non ricorra una delle eccezioni sotto elencate, gli Utenti che agiscono come Consumatori Europei godono per legge del diritto di recedere dai contratti conclusi online (contratti a distanza) entro il periodo di tempo specificato più avanti per qualsiasi motivo e senza bisogno di giustificazione.';

  @override
  String get nonEuropeanUsersNoRights =>
      'Gli Utenti che non soddisfano tali requisiti non godono dei diritti descritti in questa sezione. Il Consumatore sarà responsabile nei confronti del Venditore solo per la diminuzione del valore dei beni risultante da una manipolazione dei beni diversa da quella necessaria per stabilire la natura, le caratteristiche e il funzionamento dei beni.';

  @override
  String get exerciseOfWithdrawalRight => 'Esercizio del diritto di recesso';

  @override
  String get withdrawalExercise =>
      'Per esercitare il diritto di recesso l\'Utente deve inviare al Titolare una comunicazione inequivocabile della propria intenzione di recedere dal contratto.';

  @override
  String get withdrawalFormInstructions =>
      'A tal fine, l\'Utente può utilizzare il modulo di recesso tipo reperibile nella sezione delle definizioni di questo documento. L\'Utente è tuttavia libero di esprimere la propria intenzione di recedere dal contratto in ogni altra forma idonea. Al fine di rispettare il periodo entro il quale dev\'essere esercitato il diritto, l\'Utente deve inviare la dichiarazione di recesso prima che scada il termine di recesso.';

  @override
  String get withdrawalDeadlineQuestion =>
      'Quando scade il termine di recesso?';

  @override
  String get digitalContentWithdrawalDeadline =>
      'In caso di contratti d\'acquisto di contenuti digitali non forniti su supporto materiale il termine di recesso scade dopo 14 giorni dal giorno di conclusione del contratto, a meno che l\'Utente abbia rinunciato al diritto di recesso.';

  @override
  String get effectsOfWithdrawal => 'Effetti del recesso';

  @override
  String get withdrawalEffects =>
      'Il Titolare rimborsa tutti i pagamenti ricevuti compresi, se effettuati, quelli relativi alle spese di consegna agli Utenti che abbiano correttamente esercitato il diritto di recesso.';

  @override
  String get deliveryCostException =>
      'Tuttavia, il maggior costo derivante dalla scelta di un particolare metodo di consegna diverso dalla consegna standard più economica offerta dal Titolare, resterà a carico dell\'Utente.';

  @override
  String get refundTimeline =>
      'Il rimborso avviene senza indebito ritardo ed in ogni caso entro 14 giorni dal giorno in cui il Titolare è stato informato della decisione dell\'Utente di recedere dal contratto. Salvo ove diversamente pattuito con l\'Utente, il rimborso è effettuato utilizzando lo stesso mezzo di pagamento utilizzato per la transazione iniziale. L\'Utente non deve sostenere alcun costo quale conseguenza del recesso.';

  @override
  String get indemnification => 'Manleva';

  @override
  String get userActivityLiabilityLimitation =>
      'Limitazione della responsabilità per le attività dell\'Utente su AstroGods';

  @override
  String get generalLiabilityExclusion =>
      'Salvo ove diversamente specificato e fatte salve le disposizioni di legge applicabili, è esclusa ogni pretesa risarcitoria nei confronti del Titolare (o di qualsiasi persona fisica o giuridica che agisca per suo conto).';

  @override
  String get liabilityExceptions =>
      'Quanto precede non limita la responsabilità del Titolare per morte, danno alla persona o all\'integrità fisica o mentale, danni derivanti dalla violazione di obblighi contrattuali essenziali, quali gli obblighi strettamente necessari al raggiungimento della causa del contratto, e/o ai danni provocati con dolo o colpa grave, a condizione che l\'utilizzo di AstroGods da parte dell\'Utente sia stato idoneo e corretto.';

  @override
  String get limitedLiabilityScope =>
      'Salvo che i danni siano stati causati con dolo o colpa grave o incidano sulla vita e/o l\'integrità personale, fisica o mentale, il Titolare risponde solo nella misura del danno tipico per il tipo di contratto e prevedibile al momento della conclusione.';

  @override
  String get noResponsibilityIntro =>
      'In particolare, nei limiti sopra riportati, il Titolare non si assume alcuna responsabilità per quanto riguarda:';

  @override
  String get forceMAjeureExclusion =>
      'danni o perdite derivanti da interruzioni o malfunzionamenti di AstroGods dovuti a cause di forza maggiore o eventi imprevisti ed imprevedibili e, in ogni caso, indipendenti dalla volontà e fuori dal controllo del Titolare, quali, a mero titolo esemplificativo, guasti o interruzioni delle linee telefoniche o elettriche, della connessione Internet e/o di altri mezzi di trasmissione, inaccessibilità di siti web, scioperi, calamità naturali, virus e attacchi informatici, interruzioni di fornitura dei prodotti, servizi o applicazioni di terzi;';

  @override
  String get indirectLossExclusion =>
      'eventuali mancati guadagni o altre perdite, anche indirette, che l\'Utente potrebbe aver subito (quali, a mero titolo esemplificativo, perdite commerciali, perdita di ricavi, di profitti o risparmi preventivati, perdita di rapporti contrattuali o commerciali, perdita di avviamento o danni alla reputazione, etc.);';

  @override
  String get nonDirectLossExclusion =>
      'eventuali perdite che non siano conseguenza diretta di una violazione dei Termini da parte del Titolare;';

  @override
  String get noImplicitWaiver =>
      'Il mancato esercizio di diritti di legge o pretese derivanti da questi Termini da parte del Titolare non costituisce rinuncia agli stessi. Nessuna rinuncia può essere considerata definitiva in relazione ad uno specifico diritto o a qualsiasi altro diritto.';

  @override
  String get serviceMaintenanceRight =>
      'Per garantire il miglior livello di servizio possibile, il Titolare si riserva di interrompere il Servizio per finalità di manutenzione, aggiornamenti di sistema o per qualsiasi altra modifica, dandone idonea notizia agli Utenti.';

  @override
  String get serviceTerminationRights =>
      'Nei limiti di legge, il Titolare si riserva di sospendere o cessare completamente l\'attività del Servizio. In caso di cessazione dell\'attività del Servizio, il Titolare si adopererà affinché gli Utenti possano estrarre i propri dati personali e le informazioni e rispetterà i diritti degli Utenti relativi all\'utilizzo continuato del prodotto e/o al risarcimento, secondo le disposizioni di legge.';

  @override
  String get forceMAjeureUnavailability =>
      'Inoltre, il Servizio potrebbe non essere disponibile per cause che si sottraggono al ragionevole controllo del Titolare, quali cause di forza maggiore (p. es. malfunzionamenti infrastrutturali, blackout etc.).';

  @override
  String get advanceNotice =>
      'Il Titolare si impegna a informare l\'Utente con almeno 30 giorni di preavviso, ove possibile.';

  @override
  String get unauthorizedResale =>
      'Gli Utenti non sono autorizzati a riprodurre, duplicare, copiare, vendere, rivendere o sfruttare AstroGods o il Servizio in toto o in parte senza previo consenso scritto del Titolare, espresso direttamente o attraverso un legittimo programma di rivendite.';

  @override
  String get privacyPolicySection => 'Privacy policy';

  @override
  String get privacyPolicyReferenceContent =>
      'Per informazioni dettagliate su come raccogliamo, utilizziamo e proteggiamo i tuoi dati personali, consulta la nostra Privacy Policy completa.';

  @override
  String get viewPrivacyPolicy => 'Visualizza Privacy Policy';

  @override
  String get termsModification => 'Modifiche dei Termini';

  @override
  String get termsModificationRight =>
      'Il Titolare si riserva il diritto di modificare i Termini in ogni momento. In tal caso, il Titolare darà opportuna notizia delle modifiche agli Utenti.';

  @override
  String get modificationsEffectiveDate =>
      'Le modifiche avranno effetto nel rapporto con l\'Utente solo a partire dal momento comunicato all\'Utente.';

  @override
  String get termsModificationAcceptance =>
      'L\'utilizzo continuato del Servizio implica l\'accettazione dell\'Utente dei Termini aggiornati. Se l\'Utente non desidera accettare le modifiche, deve cessare l\'utilizzo del Servizio e può recedere dall\'Accordo.';

  @override
  String get previousVersionValidity =>
      'La versione precedente continua a disciplinare il rapporto fino all\'accettazione delle modifiche da parte dell\'Utente. Tale versione può essere richiesta al Titolare.';

  @override
  String get advanceNotificationRequirement =>
      'Se richiesto dalla legge, il Titolare comunicherà in anticipo agli Utenti la data di entrata in vigore dei Termini modificati.';

  @override
  String get contractTransferRight =>
      'Il Titolare si riserva il diritto di trasferire, cedere, disporre di, novare o appaltare singoli o tutti i diritti e le obbligazioni secondo questi Termini, avendo riguardo per gli interessi legittimi degli Utenti.';

  @override
  String get assignmentTermsApplication =>
      'Si applicano le disposizioni relative alla modifica di questi Termini.';

  @override
  String get userAssignmentRestriction =>
      'L\'Utente non è autorizzato a cedere o trasferire i propri diritti e le proprie obbligazioni secondo i Termini senza il consenso scritto del Titolare.';

  @override
  String get communicationRequirement =>
      'Tutte le comunicazioni inerenti all\'uso di AstroGods devono essere inviate ai recapiti indicati in questo documento.';

  @override
  String get generalSeverability =>
      'Qualora alcuna delle disposizioni di questi Termini dovesse essere o divenire nulla o inefficace ai sensi della legge applicabile, la nullità o inefficacia di tale disposizione non provoca inefficacia delle restanti previsioni, che permangono pertanto valide ed efficaci.';

  @override
  String get europeanUsersTitle => 'Utenti europei';

  @override
  String get europeanSeverability =>
      'Qualora una disposizione di questi Termini dovesse essere o divenire nulla, invalida o inefficace, le parti si adopereranno per individuare in via amichevole una disposizione valida ed efficace sostitutiva di quella nulla, invalida o inefficace. In caso di mancato accordo nei termini predetti, se permesso o previsto dalla legge applicabile, la disposizione nulla, invalida o inefficace sarà sostituita dalla disciplina legale applicabile.';

  @override
  String get severabilityLimitations =>
      'Fermo restando quanto sopra, la nullità, invalidità o inefficacia di una specifica disposizione di questi Termini non comporta nullità dell\'intero Accordo, a meno che le disposizioni nulle, invalidi o inefficaci nel quadro dell\'Accordo siano essenziali o di tale importanza, che le parti non avrebbero concluso il contratto se avessero saputo che la disposizione sarebbe stata invalida, ovvero in casi in cui le disposizioni residue comporterebbero un onere eccessivo ed inaccettabile per una delle parti.';

  @override
  String get governingLaw =>
      'I Termini sono disciplinati dalla legge del luogo in cui è stabilito il Titolare, così come indicato nella relativa sezione di questo documento a prescindere dalle norme di conflitto.';

  @override
  String get nationalLawPrevalence => 'Prevalenza della legge nazionale';

  @override
  String get nationalLawPrevails =>
      'Se la legge del paese in cui si trova l\'Utente prevede un livello di tutela dei consumatori superiore, prevale tale superiore livello di tutela.';

  @override
  String get competentJurisdiction => 'Foro competente';

  @override
  String get exclusiveJurisdiction =>
      'La competenza esclusiva a conoscere qualsiasi controversia derivante da o in collegamento con i Termini spetta al giudice del luogo in cui il Titolare è stabilito, così come indicato nella relativa sezione di questo documento.';

  @override
  String get europeanConsumerExceptionTitle =>
      'Eccezione per Consumatori in Europa';

  @override
  String get europeanConsumerException =>
      'Quanto precede non si applica a Utenti che agiscono come Consumatori Europei o Consumatori situati nel Regno Unito, Svizzera, Norvegia o Islanda.';

  @override
  String get amicableDisputeComposition =>
      'Composizione amichevole delle controversie';

  @override
  String get amicableDisputeResolution =>
      'Gli Utenti possono segnalare eventuali controversie al Titolare, che cercherà di risolvere in via amichevole.';

  @override
  String get judicialRightsPreservation =>
      'Per quanto resti impregiudicato il diritto degli Utenti di promuovere un\'azione in giudizio, in caso di controversie inerenti all\'uso di AstroGods o al Servizio, gli Utenti sono pregati di contattare il Titolare ai recapiti indicati in questo documento.';

  @override
  String get complaintProcedure =>
      'L\'Utente può indirizzare un reclamo all\'indirizzo e-mail del Titolare indicato in questo documento, includendo una breve descrizione e, se del caso, i dettagli dell\'ordine, acquisto o account interessato.';

  @override
  String get responseTimeline =>
      'Il Titolare provvederà ad evadere la richiesta senza indebito ritardo ed entro 14 giorni dalla sua ricezione.';

  @override
  String get agreementDefinition =>
      'Qualsiasi rapporto legalmente vincolante o contrattuale tra il Titolare e l\'Utente disciplinato dai Termini.';

  @override
  String get voucherDefinition =>
      'Qualsiasi codice o voucher digitale o cartaceo che consenta all\'Utente di acquistare il Prodotto ad un prezzo scontato.';

  @override
  String get europeanDefinition =>
      'Si applica quando l\'Utente, a prescindere dalla nazionalità, si trova nell\'Unione Europea.';

  @override
  String get ownerDefinition =>
      'Indica la persona fisica o giuridica che fornisce AstroGods e/o offre il Servizio agli Utenti.';

  @override
  String get productDefinition =>
      'Un bene o servizio disponibile tramite AstroGods, inclusi specificatamente: interpretazioni astrologiche personalizzate, analisi del tema natale, previsioni e pronostici astrologici, rapporti di compatibilità, contenuti educativi astrologici, e qualsiasi altro servizio astrologico o contenuto digitale definito separatamente nel presente documento.';

  @override
  String get serviceDefinition =>
      'Il servizio offerto tramite AstroGods così come descritto nei Termini e su AstroGods.';

  @override
  String get termsDefinition =>
      'Tutte le condizioni applicabili all\'utilizzo di AstroGods e/o alla fornitura del Servizio così come descritti in questo documento nonché in qualsiasi altro documento o accordo ad esso collegato, nella versione rispettivamente più aggiornata.';

  @override
  String get userDefinition =>
      'Indica qualsiasi persona fisica che utilizzi AstroGods.';

  @override
  String get consumerDefinition =>
      'Vale come Consumatore qualsiasi Utente considerato tale ai sensi della legge applicabile.';

  @override
  String get astroGodsDefinitionTitle => 'AstroGods (o questa Applicazione)';

  @override
  String get astroGodsDefinition =>
      'La struttura che consente la fornitura del Servizio.';

  @override
  String get agreementDefinitionTitle => 'Accordo';

  @override
  String get voucherDefinitionTitle => 'Buono';

  @override
  String get europeanDefinitionTitle => 'Europeo (o Europa)';

  @override
  String get withdrawalFormTitle => 'Modulo di recesso tipo';

  @override
  String get withdrawalFormHeader => 'Indirizzato a:';

  @override
  String get withdrawalFormAddress =>
      'Arcangelo Massari - Bologna (Italia)\ncontact@astrogods.it';

  @override
  String get withdrawalFormNotification =>
      'Con la presente io/noi notifichiamo il recesso dal mio/nostro contratto di vendita dei seguenti beni/servizi:';

  @override
  String get withdrawalFormDescription =>
      '_____________________________________________ (inserire qui una descrizione dei beni/servizi dal cui acquisto si intende recedere)';

  @override
  String get withdrawalFormOrderDate =>
      'Ordinato il: _____________________________________________ (inserire la data)';

  @override
  String get withdrawalFormReceiveDate =>
      'Ricevuto il: _____________________________________________ (inserire la data)';

  @override
  String get withdrawalFormConsumerName =>
      'Nome del/dei consumatore/i:_____________________________________________';

  @override
  String get withdrawalFormConsumerAddress =>
      'Indirizzo del/dei consumatore/i:_____________________________________________';

  @override
  String get withdrawalFormDate =>
      'Data: _____________________________________________';

  @override
  String get withdrawalFormSignature =>
      '(firmare solamente se il presente modulo è notificato in versione cartacea)';

  @override
  String get ownerDefinitionTitle => 'Titolare (o Noi)';

  @override
  String get productDefinitionTitle => 'Prodotto';

  @override
  String get serviceDefinitionTitle => 'Servizio';

  @override
  String get termsDefinitionTitle => 'Termini';

  @override
  String get userDefinitionTitle => 'Utente (o Tu)';

  @override
  String get consumerDefinitionTitle => 'Consumatore';

  @override
  String get lastModifiedTerms => 'Ultima modifica: 7 settembre 2025';

  @override
  String get termsTableOfContents => 'Indice';

  @override
  String get termsIntroductionSection => 'Introduzione';

  @override
  String get astrologicalServiceNatureSection =>
      'Natura del servizio astrologico';

  @override
  String get termsOfUseSection => 'Condizioni d\'uso';

  @override
  String get salesTermsSection => 'Termini e condizioni di vendita';

  @override
  String get deliverySection => 'Consegna';

  @override
  String get contractDurationSection => 'Durata del contratto';

  @override
  String get userRightsSection => 'Diritti dell\'Utente';

  @override
  String get liabilitySection => 'Limitazione di responsabilità e manleva';

  @override
  String get commonProvisionsSection => 'Disposizioni comuni';

  @override
  String get disputeResolutionSection => 'Risoluzione delle controversie';

  @override
  String get cookiesAndTrackingSection => 'Cookie e tracciamento';

  @override
  String get cookiesAndTrackingReferenceContent =>
      'Per informazioni dettagliate sui cookie e le tecnologie di tracciamento che utilizziamo, consulta la nostra Cookie Policy completa.';

  @override
  String get viewCookiePolicy => 'Visualizza Cookie Policy';

  @override
  String get cookiesAndTrackingTitle => 'Cookie e tracciamento';

  @override
  String get contactUsSection => 'Contattaci';

  @override
  String get appleThirdPartyBeneficiary =>
      'Nonostante il rapporto contrattuale relativo all\'acquisto di tali Prodotti sia concluso esclusivamente tra Titolare e Utenti, gli Utenti riconoscono e accettano che, qualora la fornitura di AstroGods sia avvenuta tramite l\'Apple App Store o Google Play Store, il rispettivo fornitore della piattaforma potrebbe esercitare diritti derivanti da questi Termini in qualità di terzo beneficiario.';

  @override
  String get astroGodsServiceOf => 'AstroGods è un servizio di:';

  @override
  String get astroGodsRefersTo => '\"AstroGods\" si riferisce a';

  @override
  String get thisSiteDescription =>
      'questo sito web, accessibile tramite browser, inclusi i relativi sottodomini ed ogni altro sito attraverso i quali il Titolare offre il Servizio;';

  @override
  String get mobileApplicationsDescription =>
      'applicazioni per dispositivi mobili (iOS e Android), tablet, desktop (Linux, Windows, macOS) o piattaforme simili;';

  @override
  String get termsOfUseGeneralValidity =>
      'Salvo ove diversamente specificato, le condizioni d\'uso di AstroGods esposte in questa sezione hanno validità generale.';

  @override
  String get additionalConditions =>
      'Ulteriori condizioni d\'uso o d\'accesso applicabili in particolari situazioni sono espressamente indicate in questo documento.';

  @override
  String get usingAstroGodsUserDeclares =>
      'Utilizzando AstroGods l\'Utente dichiara di soddisfare i seguenti requisiti:';

  @override
  String get passwordSecurity =>
      'È responsabilità degli Utenti conservare le proprie credenziali d\'accesso in modo sicuro e preservarne la confidenzialità. A tal fine, gli Utenti devono scegliere una password che corrisponda al più alto livello di sicurezza disponibile su AstroGods.';

  @override
  String get accountResponsibility =>
      'Creando un account l\'Utente accetta di essere pienamente responsabile di ogni attività posta in atto con le sue credenziali d\'accesso. Gli Utenti sono tenuti a informare il Titolare immediatamente e univocamente tramite i recapiti indicati in questo documento qualora ritengano che le proprie informazioni personali, quali ad esempio l\'account Utente, le credenziali d\'accesso o dati personali, siano state violate, illecitamente diffuse o sottratte.';

  @override
  String get registrationRequirementsText =>
      'La registrazione di un account Utente su AstroGods è soggetta alle condizioni sotto specificate. Registrando un account, l\'Utente conferma di soddisfare tali condizioni.';

  @override
  String get accountClosureProcedure =>
      'L\'Utente è libero di chiudere il proprio account e cessare l\'utilizzo del Servizio in qualsiasi momento, seguendo questa procedura:';

  @override
  String get usingAccountClosureTools =>
      'Usando gli strumenti di chiusura dell\'account disponibili su AstroGods.';

  @override
  String get paidSubscriptionSuspension =>
      'La chiusura dell\'account Utente sarà tuttavia sospesa fino alla scadenza di eventuali servizi a pagamento in abbonamento acquistati dall\'Utente.';

  @override
  String get noCompensationForSuspension =>
      'La sospensione o cancellazione dell\'account non da all\'Utente alcun diritto di risarcimento, rimborso o indennizzo.';

  @override
  String get paymentObligationRemains =>
      'La sospensione o cancellazione di un account per cause addebitabili all\'Utente non esonera l\'Utente dal pagamento dei compensi o prezzi eventualmente applicabili.';

  @override
  String get thirdPartyResourcesDisclaimer =>
      'Le condizioni applicabili alle risorse fornite da terzi, ivi incluse quelle applicabili a eventuali concessioni di diritti su contenuti, sono determinate dagli stessi terzi e regolate nei relativi termini e condizioni o, in loro assenza, dalla legge.';

  @override
  String get userExclusiveResponsibility =>
      'È responsabilità esclusiva dell\'Utente di far sì che l\'uso di AstroGods e/o del Servizio non violi la legge, i regolamenti o i diritti di terzi.';

  @override
  String get ownerProtectiveRights =>
      'Pertanto, il Titolare si riserva il diritto di adottare ogni misura idonea a proteggere i propri interessi legittimi, ed in particolare di negare all\'Utente l\'accesso a AstroGods o al Servizio, risolvere contratti, denunciare ogni attività censurabile svolta tramite AstroGods o il Servizio alle autorità competenti – p. es. l\'autorità giudiziaria o amministrativa – ogniqualvolta l\'Utente ponga in essere o vi sia il sospetto che ponga in essere:';

  @override
  String get violationsOfLaw =>
      'violazioni di legge, regolamenti e/o dei Termini;';

  @override
  String get injuryToThirdPartyRights => 'lesioni di diritti di terzi;';

  @override
  String get actsHarmingOwnerInterests =>
      'atti che possono pregiudicare considerevolmente i legittimi interessi del Titolare;';

  @override
  String get offensesToOwnerOrThird => 'offese al Titolare o a un terzo.';

  @override
  String get referralBenefits =>
      'AstroGods consente agli Utenti di ricevere dei vantaggi se, grazie a una loro raccomandazione, un nuovo Utente acquista un Prodotto offerto su AstroGods.';

  @override
  String get referralCodeUsage =>
      'Per usufruire di questa opportunità, l\'Utente può invitare gli amici ad acquistare Prodotti su AstroGods inviando loro un apposito codice fornito dal Titolare. Ogni codice può essere riscattato una volta sola.';

  @override
  String get referralRewardSystem =>
      'Se una delle persone invitate acquistando un Prodotto su AstroGods decide di riscattare un codice di invito, l\'Utente che l\'ha invitata riceverà il vantaggio o beneficio (quali, ad esempio: uno sconto, un servizio aggiuntivo, un upgrade etc.) indicato su AstroGods.';

  @override
  String get referralCodeLimitations =>
      'I codici di invito potrebbero essere spendibili solo per alcuni Prodotti tra quelli offerti su AstroGods.';

  @override
  String get ownerDiscretionaryRight =>
      'Il Titolare si riserva il diritto di cessare l\'offerta in qualsiasi momento a propria discrezione.';

  @override
  String get referralLimitations =>
      'Sebbene non vi sia alcun limite al numero di persone che possono essere invitate, il numero di vantaggi o benefici che ogni Utente può ricevere per un egual numero di codici invito riscattati potrebbe essere sottoposto a un limite massimo.';

  @override
  String get salesTermsIntro =>
      'Alcuni dei Prodotti offerti su AstroGods come parte del servizio sono a pagamento.';

  @override
  String get salesTermsDetails =>
      'Le tariffe, la durata e le condizioni applicabili alla vendita di tali Prodotti sono descritte di seguito e nelle rispettive sezioni di AstroGods.';

  @override
  String get purchaseRegistrationRequired =>
      'Per acquistare i Prodotti, l\'Utente è tenuto a registrarsi o ad effettuare l\'accesso a AstroGods.';

  @override
  String get productDescriptionInfo =>
      'Prezzi, descrizioni e disponibilità dei Prodotti astrologici (incluse letture personalizzate del tema natale, analisi di compatibilità, previsioni giornaliere e mensili, approfondimenti sulle relazioni e raccomandazioni astrologiche per i viaggi) sono specificati nelle rispettive sezioni di AstroGods e sono soggetti a modifica senza preavviso.';

  @override
  String get productRepresentationDisclaimer =>
      'Sebbene i Prodotti su AstroGods siano presentati con la massima accuratezza tecnicamente possibile, la rappresentazione su AstroGods tramite qualsiasi mezzo (inclusi, a seconda dei casi, materiali grafici, immagini, colori, suoni) è da intendersi come mero riferimento e non implica alcuna garanzia in merito alle caratteristiche del Prodotto acquistato.';

  @override
  String get productCharacteristicsSpecified =>
      'Le caratteristiche del Prodotto selezionato saranno specificate durante la procedura d\'acquisto.';

  @override
  String get purchaseProcedureSteps =>
      'Ogni fase, dalla scelta del prodotto fino all\'inoltro dell\'ordine, fa parte della procedura d\'acquisto. La procedura d\'acquisto comprende i seguenti passaggi:';

  @override
  String get stripeCheckoutAccess =>
      'Cliccando sul pulsante di checkout, gli Utenti accedono all\'area di checkout di Stripe dove verrà richiesto loro di indicare i propri recapiti e un mezzo di pagamento a loro scelta.';

  @override
  String get stripePaymentStorage =>
      'Gli Utenti che non lo hanno ancora fatto, possono richiedere a Stripe di memorizzare le loro informazioni di pagamento per acquisti futuri su AstroGods o su altri siti che utilizzano Stripe come portale di pagamento. Per ricevere informazioni sul trattamento dei dati personali ed i relativi diritti, l\'Utente può consultare la privacy policy di Stripe e di AstroGods.';

  @override
  String get stripeBillingAddress =>
      'All\'interno dell\'area di checkout di Stripe, potrebbe essere richiesto agli Utenti di specificare anche il loro indirizzo di fatturazione e di spedizione.';

  @override
  String get stripeExpressCheckout =>
      'All\'interno dell\'area di checkout di Stripe, gli Utenti avranno la possibilità di scegliere il checkout diretto. Il checkout diretto consente agli Utenti di completare l\'acquisto direttamente, utilizzando le informazioni di pagamento e i recapiti memorizzati dai più comuni servizi online di gestione dei pagamenti (come \"ApplePay\", \"Google Pay\", \"Microsoft Pay\").';

  @override
  String get orderSubmissionRequirement =>
      'Per inoltrare l\'ordine, gli Utenti sono tenuti ad accettare i presenti Termini e ad utilizzare il rispettivo pulsante o meccanismo su AstroGods, in tal modo, impegnandosi a pagare il prezzo concordato.';

  @override
  String get orderSubmissionConsequences =>
      'L\'invio dell\'ordine comporta quanto segue:';

  @override
  String get contractConclusion =>
      'L\'invio dell\'ordine da parte dell\'utente determina la conclusione del contratto e fa sorgere in capo all\'Utente l\'obbligo di pagare prezzo, tasse ed eventuali ulteriori oneri e spese, così come specificato nella pagina dell\'ordine.';

  @override
  String get userCollaborationObligation =>
      'Nel caso in cui il Prodotto acquistato richieda un\'azione da parte dell\'Utente, come la fornitura di informazioni o dati personali, specificazioni o richieste particolari, l\'inoltro dell\'ordine costituisce in capo all\'Utente anche l\'obbligo di collaborare di conseguenza.';

  @override
  String get orderConfirmationEmail =>
      'Una volta inoltrato l\'ordine, agli Utenti sarà inviata una conferma di ricezione dell\'ordine.';

  @override
  String get purchaseNotifications =>
      'Tutte le notifiche relative alla procedura d\'acquisto sopra descritta saranno inviate all\'indirizzo di posta elettronica fornito dall\'Utente a tal fine.';

  @override
  String get pricingTransparency =>
      'Durante la procedura d\'acquisto e prima dell\'inoltro dell\'ordine, gli Utenti vengono debitamente informati di tutte le commissioni, tasse e costi (comprese eventuali spese di spedizione) che saranno loro addebitati.';

  @override
  String get pricingPolicy =>
      'I prezzi su AstroGods includono tutte le commissioni, tasse e costi applicabili.';

  @override
  String get promotionsDisclaimer =>
      'Il Titolare potrebbe offrire sconti o promozioni speciali per l\'acquisto dei Prodotti. Tali promozioni o sconti sono sempre soggetti ai requisiti ed a termini e condizioni previste nella relativa sezione di AstroGods.';

  @override
  String get promotionsDiscretion =>
      'Promozioni e offerte sono sempre concesse a sola discrezione del Titolare.';

  @override
  String get promotionsNoRights =>
      'Promozioni o sconti ripetuti o periodici non costituiscono alcuna pretesa o diritto azionabili dagli Utenti in futuro.';

  @override
  String get promotionsTimeLimit =>
      'A seconda dei casi, sconti e promozioni valgono per un determinato periodo di tempo o fino ad esaurimento scorte. Salvo ove diversamente specificato, le limitazioni di tempo di promozioni e sconti si intendono riferite al fuso orario della sede del Titolare, come indicata nei recapiti in questo documento.';

  @override
  String get vouchersPromoForm =>
      'Promozioni e sconti possono essere offerti sotto forma di Buoni.';

  @override
  String get vouchersViolationConsequences =>
      'In caso di violazione delle condizioni applicabili ai Buoni, il Titolare può legittimamente rifiutare di adempiere ai propri obblighi contrattuali e si riserva espressamente il diritto di agire nelle opportune sedi anche giudiziarie al fine di tutelare i propri diritti e interessi.';

  @override
  String get vouchersAdditionalProvisions =>
      'Eventuali disposizioni aggiuntive o divergenti applicabili all\'utilizzo dei Buoni riportate nella relativa pagina informativa o sul Buono stesso prevalgono in ogni caso, a prescindere dalle disposizioni che seguono.';

  @override
  String get vouchersRules =>
      'Salvo ove diversamente specificato, le seguenti regole si applicano all\'utilizzo dei Buoni:';

  @override
  String get voucherValidityRule =>
      'Ciascun Buono è valido solo se utilizzato secondo le modalità e nel periodo di tempo specificati sul sito web e/o sul Buono;';

  @override
  String get voucherFullRedemption =>
      'Il Buono può essere riscattato solo integralmente al momento dell\'acquisto – non è consentito l\'utilizzo parziale;';

  @override
  String get voucherSingleUse =>
      'Salvo ove diversamente specificato, i Buoni monouso possono essere riscattati una sola volta per acquisto e possono pertanto essere riscattati una sola volta anche nel caso di acquisti rateizzati;';

  @override
  String get vouchersNotCumulative => 'I Buoni non sono cumulabili;';

  @override
  String get voucherExpiration =>
      'Il Buono deve essere utilizzato entro il termine di validità specificato. Scaduto il termine, il Buono sarà automaticamente annullato. Resta esclusa qualsiasi possibilità di rivendicare diritti, compreso al rimborso del valore del Buono;';

  @override
  String get voucherNoCredit =>
      'L\'Utente non ha diritto ad alcun accredito/rimborso/compensazione nel caso vi sia differenza tra il valore del Buono e il valore riscattato;';

  @override
  String get voucherNonCommercialUse =>
      'Il Buono è da intendersi esclusivamente ad uso non commerciale. La riproduzione, contraffazione e commercializzazione del Buono sono severamente vietate, così come qualsiasi attività illecita connessa all\'acquisto e/o utilizzo del Buono.';

  @override
  String get paymentMethodsInfo =>
      'AstroGods elabora tutti i pagamenti in sicurezza tramite Stripe, un processore di pagamenti certificato conforme PCI DSS. I metodi di pagamento accettati includono le principali carte di credito e debito (Visa, Mastercard, American Express), portafogli digitali (Apple Pay, Google Pay), e altri metodi disponibili tramite Stripe nella tua regione.';

  @override
  String get paymentMethodsConditions =>
      'L\'elaborazione dei pagamenti è gestita interamente da Stripe Technology Europe Ltd. AstroGods non memorizza né ha accesso ai dettagli delle tue carte di pagamento, che sono elaborati e archiviati in sicurezza da Stripe secondo i più alti standard di sicurezza del settore.';

  @override
  String get paymentThirdPartyHandling =>
      'Tutti i pagamenti vengono gestiti autonomamente da servizi terzi. Pertanto, AstroGods non raccoglie dati relativi al pagamento – quali numeri di carta di credito – ma riceve una notifica una volta che il pagamento è andato a buon fine. Per ricevere ulteriori informazioni sul trattamento dei dati personali e sui relativi diritti, l\'Utente può fare riferimento alla privacy policy di AstroGods.';

  @override
  String get paymentFailureConsequences =>
      'Nel caso in cui il pagamento effettuato con uno dei mezzi disponibili fallisca o venga rifiutato dal fornitore di servizi di pagamento, il Titolare non è obbligato a eseguire l\'ordine. Nel caso in cui il pagamento non vada a buon fine, il Titolare si riserva il diritto di richiedere all\'Utente il rimborso di qualsiasi spesa o danno correlato.';

  @override
  String get stripeRecurringPayments =>
      'Per i servizi in abbonamento, Stripe memorizza in sicurezza le informazioni del metodo di pagamento per elaborare automaticamente i pagamenti ricorrenti. Gli utenti possono gestire, aggiornare o annullare i loro metodi di pagamento e abbonamenti tramite il portale clienti accessibile dalle impostazioni del loro account.';

  @override
  String get stripeCustomerPortal =>
      'Gli utenti possono accedere al Portale Clienti Stripe per visualizzare la cronologia di fatturazione, scaricare fatture, aggiornare i metodi di pagamento e gestire le impostazioni degli abbonamenti. Questo portale è fornito direttamente da Stripe e garantisce l\'accesso sicuro alle informazioni di pagamento e fatturazione.';

  @override
  String get appStorePurchases =>
      'AstroGods o determinati Prodotti in vendita su AstroGods devono essere acquistati tramite un app store terzo. Per poter effettuare tali acquisti gli Utenti sono pregati di seguire le istruzioni nel relativo app store (ad esempio \"Apple App Store\" o \"Google Play\"). Tali informazioni possono variare a seconda dello specifico dispositivo utilizzato.';

  @override
  String get appStoreTermsPrecedence =>
      'Salvo ove diversamente specificato, gli acquisti effettuati tramite negozi online di terze parti sono soggetti anche ai termini e condizioni di tali terzi. Tali termini e condizioni prevalgono in ogni caso di incongruenza o conflitto rispetto ai presenti Termini.';

  @override
  String get appStoreTermsAcceptance =>
      'Pertanto, gli Utenti che effettuano acquisti attraverso tali negozi online di terzi sono pregati di leggere attentamente ed accettare i relativi termini e condizioni di vendita.';

  @override
  String get ownershipReservationTitle => 'Riserva di proprietà';

  @override
  String get ownershipReservation =>
      'Fino alla ricezione del pagamento del prezzo integrale di acquisto da parte del Titolare, l\'Utente non acquista la proprietà dei Prodotti ordinati.';

  @override
  String get usageRightsReservationTitle => 'Riserva dei diritti d\'uso';

  @override
  String get usageRightsReservation =>
      'Fino alla ricezione del pagamento del prezzo integrale di acquisto da parte del Titolare, l\'Utente non acquista i diritti d\'uso dei Prodotti ordinati.';

  @override
  String get contractualWithdrawalRightTitle =>
      'Diritto contrattuale di recesso';

  @override
  String get contractualWithdrawalRight =>
      'Il Titolare concede agli Utenti il diritto contrattuale di recedere dal contratto d\'acquisto secondo i termini e le condizioni esplicitati nella relativa sezione di AstroGods entro 30 giorni dalla conclusione del contratto.';

  @override
  String get delivery => 'Consegna';

  @override
  String get digitalContentDeliveryDetails =>
      'Salvo ove diversamente specificato, i contenuti astrologici acquistati su AstroGods consistono in interpretazioni e analisi testuali (incluse analisi del tema natale, interpretazioni personalizzate, previsioni e rapporti di compatibilità) consegnati digitalmente attraverso l\'interfaccia dell\'applicazione online. AstroGods funziona principalmente come servizio online accessibile tramite browser web e applicazioni mobili.';

  @override
  String get deviceRequirements =>
      'Gli Utenti riconoscono ed accettano che, per scaricare e/o utilizzare il Prodotto, il dispositivo o i dispositivi prescelti ed il rispettivo software (compresi i sistemi operativi) debbano essere legali, d\'uso comune, aggiornati e in linea con gli attuali standard di mercato.';

  @override
  String get downloadLimitations =>
      'Gli Utenti riconoscono ed accettano che la possibilità di scaricare il Prodotto acquistato potrebbe essere limitata nel tempo e nello spazio.';

  @override
  String get trialPeriodAvailability =>
      'Gli Utenti hanno la possibilità di provare AstroGods o singoli Prodotti gratuitamente per un periodo di prova di 7 giorni, non rinnovabile. Alcune funzioni o funzionalità di AstroGods potrebbero non essere disponibili durante il periodo di prova. Ulteriori condizioni applicabili al periodo di prova saranno esplicitate su AstroGods.';

  @override
  String get subscriptionContinuousProduct =>
      'Grazie all\'abbonamento, l\'Utente riceve un Prodotto in via continuativa o periodica. I dettagli riguardanti il tipo di abbonamento e la risoluzione sono descritti di seguito.';

  @override
  String get lifetimeSubscriptionDuration =>
      'Gli abbonamenti a vita sono abbonamenti che restano attivi per l\'intera durata di attività del Prodotto abbonato. Gli abbonamenti a vita decorrono dal giorno in cui il Titolare riceve il pagamento. Essi terminano solo se e quando il relativo Prodotto cessa la sua attività.';

  @override
  String get fixedTermSubscriptionEnd =>
      'Una volta terminata la durata dell\'abbonamento, il Prodotto non sarà più accessibile.';

  @override
  String get appleAccountSubscriptions =>
      'Gli Utenti possono concludere l\'abbonamento ad un Prodotto utilizzando l\'Apple Account associato al loro account Apple App Store tramite la relativa procedura su AstroGods. Nel fare ciò, gli Utenti riconoscono ed accettano che:';

  @override
  String get appleAccountPayment =>
      'qualsiasi pagamento dovuto sarà addebitato all\'account Apple;';

  @override
  String get appleAccountAutoRenewal =>
      'gli abbonamenti si rinnovano automaticamente per la stessa durata a meno che l\'Utente non comunichi disdetta almeno 24 ore prima della scadenza del periodo di abbonamento corrente;';

  @override
  String get appleAccountRenewalCharges =>
      'tutti i compensi o pagamenti dovuti per il rinnovo saranno addebitati entro 24 ore prima della scadenza del periodo corrente;';

  @override
  String get appleAccountManagement =>
      'gli abbonamenti possono essere gestiti o disdetti direttamente tramite le impostazioni dell\'account Apple App Store dell\'Utente.';

  @override
  String get appleTermsPrecedence =>
      'Quanto sopra prevale su qualsiasi disposizione contrastante o divergente dei Termini.';

  @override
  String get automaticRenewalPolicy =>
      'Gli abbonamenti si rinnovano automaticamente tramite il sistema di fatturazione sicuro di Stripe con addebito sul mezzo di pagamento scelto dall\'Utente. Gli utenti ricevono notifiche email prima di ogni rinnovo e possono annullare o modificare il loro abbonamento in qualsiasi momento tramite il Portale Clienti Stripe.';

  @override
  String get renewalDurationMatch =>
      'Il rinnovo ha durata uguale al periodo di abbonamento originario.';

  @override
  String get subscriptionTermination =>
      'Gli abbonamenti possono essere risolti: (1) accedendo al Portale Clienti Stripe tramite le impostazioni del proprio account per annullare immediatamente, (2) inviando una comunicazione di disdetta chiara al Titolare utilizzando i recapiti riportati in questo documento, o (3) seguendo le istruzioni di cancellazione su AstroGods.';

  @override
  String get cancellationEffectiveTiming =>
      'Qualora la comunicazione della disdetta pervenga al Titolare prima della data di rinnovo dell\'abbonamento, la risoluzione avrà effetto allo scadere del periodo in corso.';

  @override
  String get consumerExceptionTitle => 'Eccezione per i Consumatori';

  @override
  String get consumerIndefiniteExtension =>
      'Alla fine del termine iniziale, gli abbonamenti sono automaticamente prorogati a tempo indeterminato, a meno che l\'Utente non disdica prima della fine di tale termine.';

  @override
  String get consumerRenewalCharging =>
      'Il corrispettivo dovuto al momento della proroga sarà addebitato sul metodo di pagamento che l\'Utente ha scelto in occasione dell\'acquisto.';

  @override
  String get consumerMonthlyTermination =>
      'Dopo la proroga, l\'abbonamento avrà una durata indeterminata e potrà essere risolto mensilmente.';

  @override
  String get consumerCancellationTiming =>
      'Qualora la disdetta pervenga al Titolare entro la fine del mese in corso, l\'abbonamento scade alla fine di tale mese.';

  @override
  String get resolution => 'Risoluzione';

  @override
  String get appleAccountSubscriptionsTitle =>
      'Abbonamenti gestiti tramite Apple Account';

  @override
  String get differentiatedLicensingSection => 'Licenze differenziate';

  @override
  String get differentiatedLicensing => 'Licenze differenziate per contenuti';

  @override
  String get differentiatedLicensingText =>
      'I contenuti di AstroGods sono soggetti a tre regimi di licenza distinti:';

  @override
  String get proprietaryContentStandard => 'A) Contenuti proprietari standard';

  @override
  String get proprietaryContentStandardText =>
      'L\'interfaccia dell\'applicazione, gli algoritmi, il software, i marchi, il database degli utenti e tutti gli elementi tecnici rimangono di proprietà esclusiva del Titolare con tutti i diritti riservati.';

  @override
  String get codexCreativeCommons =>
      'B) Codex - Contenuti educativi (licenza CC BY 4.0)';

  @override
  String get codexCreativeCommonsText =>
      'I contenuti del Codex, inclusi testi interpretativi, immagini e materiali educativi, sono rilasciati sotto licenza Creative Commons Attribution 4.0 International. Gli utenti possono:';

  @override
  String get codexRights1 =>
      'Riprodurre, distribuire e comunicare pubblicamente l\'opera';

  @override
  String get codexRights2 =>
      'Modificare, trasformare l\'opera e creare opere derivate';

  @override
  String get codexRights3 => 'Utilizzare l\'opera per fini commerciali';

  @override
  String get codexAttributionRequired =>
      'Condizione obbligatoria: Attribuzione tramite citazione \"Fonte: AstroGods (astrogods.it) - Licenza CC BY 4.0\"';

  @override
  String get codexThirdPartyLicenseHierarchy =>
      'Laddove i contenuti del Codex incorporino materiali di terze parti soggetti a licenze più restrittive, prevalgono i termini della licenza più restrittiva. Gli utenti devono identificare e rispettare tutti i requisiti di licenza applicabili, inclusa l\'attribuzione alle fonti originali.';

  @override
  String get aiGeneratedInterpretations =>
      'C) Interpretazioni personalizzate generate dall\'intelligenza artificiale';

  @override
  String get aiGeneratedInterpretationsText =>
      'Le interpretazioni astrologiche personalizzate generate dal servizio possono essere liberamente riutilizzate dagli utenti per qualsiasi scopo, purché accompagnate dalla dicitura: \"Interpretazione generata da AstroGods (astrogods.it)\"';

  @override
  String get startFreeSevenDays => 'INIZIA GRATIS - 7 GIORNI';

  @override
  String thenPricePerMonth(Object price) {
    return 'Poi $price/mese';
  }

  @override
  String billedAnnuallyAt(Object amount) {
    return 'fatturati $amount/anno';
  }

  @override
  String saveAmount(Object amount) {
    return 'RISPARMI $amount/ANNO';
  }

  @override
  String get exploreOtherPlans => 'Esplora altri piani';

  @override
  String get hideOtherPlans => 'Nascondi altri piani';

  @override
  String get recommendedPlan => 'MIGLIOR VALORE';

  @override
  String get currentPlan => 'Piano attuale';

  @override
  String get upgrade => 'Passa a Premium';

  @override
  String get downgrade => 'Passa a Standard';

  @override
  String get nextRenewal => 'Prossimo rinnovo';

  @override
  String get changePlan => 'Cambia piano';

  @override
  String get birthInformation => 'Informazioni di Nascita';

  @override
  String get dateOfBirth => 'Data di Nascita';

  @override
  String get placeOfBirth => 'Luogo di Nascita';

  @override
  String get timeOfBirth => 'Ora di Nascita';

  @override
  String get unknownTime => 'Sconosciuta';

  @override
  String get person => 'Persona';

  @override
  String get transitInformation => 'Informazioni sul transito';

  @override
  String get transitDate => 'Data del transito';

  @override
  String get transitLocation => 'Luogo del transito';

  @override
  String get transitPeriod => 'Periodo del transito';

  @override
  String get lunarPhase => 'Fase lunare';

  @override
  String dayNumber(int number) {
    return 'giorno $number';
  }

  @override
  String dailyTransitOf(String name) {
    return 'Transito giornaliero di $name';
  }

  @override
  String monthlyTransitOf(String name) {
    return 'Transito mensile di $name';
  }

  @override
  String get pdfDownloadedSuccessfully => 'PDF scaricato con successo';

  @override
  String get downloadPdf => 'Scarica PDF';

  @override
  String get savePdfDialogTitle => 'Salva PDF';

  @override
  String get sharePdf => 'Condividi PDF';

  @override
  String get generatingPdf => 'Generazione PDF...';

  @override
  String pdfGenerationError(Object error) {
    return 'Errore generazione PDF: $error';
  }

  @override
  String get generateDailyTransit => 'Genera Transito Giornaliero';

  @override
  String get generateMonthlyTransit => 'Genera Transito Mensile';

  @override
  String get dailyMonthlyTransits => 'Transiti giornalieri e mensili';

  @override
  String get dailyPredictions => 'Previsioni del giorno';

  @override
  String get monthlyPredictions => 'Previsioni del mese';

  @override
  String get anticipateYourDayWithTransits =>
      'Anticipa la tua giornata con l\'analisi dei transiti';

  @override
  String get anticipateYourMonthWithTransits =>
      'Anticipa il tuo mese con l\'analisi dei transiti';

  @override
  String get pleaseSelectBirthChart => 'Seleziona un tema natale';

  @override
  String get pleaseSelectDate => 'Seleziona una data';

  @override
  String get pleaseSelectLocation => 'Seleziona una località';

  @override
  String get selectLocation => 'Seleziona località';

  @override
  String get transitFor => 'Transito per';

  @override
  String get dailySkyOf => 'Cielo del giorno';

  @override
  String get monthlySkyOf => 'Cielo del mese';

  @override
  String get selectDate => 'Seleziona data';

  @override
  String get selectMonth => 'Seleziona mese';

  @override
  String get selectChart => 'Seleziona tema';

  @override
  String get subscribeToDaily => 'Iscriviti all\'oroscopo giornaliero';

  @override
  String get subscribeToMonthly => 'Iscriviti all\'oroscopo mensile';

  @override
  String get unsubscribe => 'Cancella iscrizione';

  @override
  String get subscribeSuccess =>
      'Iscrizione alla newsletter completata con successo';

  @override
  String get unsubscribeSuccess =>
      'Cancellazione dalla newsletter completata con successo';

  @override
  String get noNewsletterSubscriptions => 'Nessun oroscopo via email attivo';

  @override
  String get emailNotifications => 'Oroscopo via email';

  @override
  String get newsletterType => 'Tipo newsletter';

  @override
  String get currentLocation => 'Posizione attuale';

  @override
  String get addNewsletter => 'Aggiungi oroscopo via email';

  @override
  String get create => 'Crea';

  @override
  String get birthChartCreated => 'Tema natale creato con successo';

  @override
  String get authenticationRequired => 'Autenticazione richiesta';

  @override
  String get pleaseLoginToSaveCharts =>
      'Accedi per salvare i temi natali nel tuo account. Senza accesso, i temi non possono essere salvati per uso futuro.';

  @override
  String get premiumRequiredForDailyTransit =>
      'Abbonamento Premium richiesto per generare letture di transiti giornalieri';

  @override
  String get premiumRequiredForMonthlyTransit =>
      'Abbonamento Premium richiesto per generare letture di transiti mensili';

  @override
  String get premiumRequiredForSynastry =>
      'Abbonamento Premium richiesto per creare analisi di coppia';

  @override
  String get unsubscribeError => 'Errore nella disiscrizione';

  @override
  String get unsubscribeSuccessMessage =>
      'Non riceverai più queste email. Puoi iscriverti nuovamente dalle impostazioni del tuo account.';

  @override
  String get goHome => 'Vai alla Home';

  @override
  String get allNewsletters => 'Tutte le newsletter';

  @override
  String get birthChart => 'Tema natale';

  @override
  String get processingUnsubscribeRequest =>
      'Elaborazione richiesta di disiscrizione...';

  @override
  String get unknownErrorOccurred => 'Si è verificato un errore sconosciuto';

  @override
  String get networkErrorOccurred => 'Si è verificato un errore di rete';

  @override
  String get newMoon => 'Luna nuova';

  @override
  String get waxingCrescent => 'Luna crescente';

  @override
  String get firstQuarter => 'Primo quarto';

  @override
  String get waxingGibbous => 'Gibbosa crescente';

  @override
  String get fullMoon => 'Luna piena';

  @override
  String get waningGibbous => 'Gibbosa calante';

  @override
  String get lastQuarter => 'Ultimo quarto';

  @override
  String get waningCrescent => 'Luna calante';

  @override
  String dayCount(Object day) {
    return 'Giorno $day';
  }

  @override
  String get connectionError =>
      'Connessione non riuscita. Controlla la rete e riprova.';

  @override
  String get serverUnavailable =>
      'Stiamo facendo qualche miglioria. Torniamo tra un attimo!';

  @override
  String get connectionTimeout =>
      'La richiesta ha impiegato troppo tempo. Riprova.';

  @override
  String get aboutAndFaq => 'Chi siamo e FAQ';

  @override
  String get aboutFaqTitle => 'Chi siamo';

  @override
  String get aboutFaqTableOfContents => 'Indice';

  @override
  String get storySectionTitle => 'La nostra storia';

  @override
  String get missionSectionTitle => 'La nostra missione';

  @override
  String get teamSectionTitle => 'Il team';

  @override
  String get faqSectionTitle => 'Domande frequenti';

  @override
  String get storyText =>
      'AstroGods nasce da un\'amicizia. Arcangelo è sempre stato colpito dalla capacità di Jacopo di descrivere con precisione persone basandosi solo sulla loro data di nascita, e di leggere momenti della sua vita con una profondità inspiegabile. Ha voluto portare sempre con sé quello sguardo, e così è nato AstroGods: un tentativo di tradurre in algoritmo il metodo che Jacopo usa per decifrare la realtà attraverso l\'Astrologia.';

  @override
  String get missionText =>
      'La nostra è innanzitutto una missione di ricerca: siamo i primi a essere curiosi di scoprire cosa è possibile fare con questo strumento. Utilizziamo un software che tiene in considerazione tutti i fattori contemporaneamente per raggiungere interpretazioni sempre più precise. AstroGods rende l\'interpretazione astrologica più accessibile a chi non è esperto, e allo stesso tempo semplifica il lavoro dell\'astrologo: per quanto bravo e per quanto esperto, si trova a dover miscelare simbolicamente infiniti elementi. Avere uno strumento che li tenga tutti in considerazione permette di non scordarsi niente: un supporto che potenzia, non sostituisce, l\'esperienza umana.';

  @override
  String get teamMemberJacopoTitle => 'Jacopo Trombetti';

  @override
  String get teamMemberJacopoRole => 'Astrologo';

  @override
  String get teamMemberJacopoDescription =>
      'Formato presso l\'Accademia di Astrologia Egizia fondata da Pascal Fabio Patruno, Jacopo è un astrologo geniale, capace di computare a mente la sinastria tra due persone, memorizzando gradi e pianeti di temi che ha visto una sola volta nella sua vita.';

  @override
  String get teamMemberArcangeloTitle => 'Arcangelo Massari';

  @override
  String get teamMemberArcangeloRole => 'Sviluppo tecnico';

  @override
  String get teamMemberArcangeloDescription =>
      'Allievo di Jacopo e responsabile della parte tecnica di AstroGods. Appassionato di Astrologia, studia l\'argomento dal 2016.';

  @override
  String get teamMemberCorradoTitle => 'Corrado Camponeschi';

  @override
  String get teamMemberCorradoRole => 'Comunità';

  @override
  String get teamMemberCorradoDescription =>
      'Esploratore di vari percorsi di autoconoscenza, Corrado si occupa di far conoscere AstroGods al mondo e di creare ponti tra l\'Astrologia e altre discipline.';

  @override
  String get faq1Question =>
      'L\'intelligenza artificiale non rende le interpretazioni casuali?';

  @override
  String get faq1Answer =>
      'L\'IA svolge un ruolo minore in AstroGods. Le interpretazioni sono scritte a mano e curate da Jacopo Trombetti e Arcangelo Massari. I calcoli astronomici utilizzano le Effemeridi Svizzere, le più precise al mondo. L\'IA si limita ad assemblare i vari pezzi interpretativi in frasi di senso compiuto, niente di più.';

  @override
  String get faq2Question => 'Perché non ci sono Urano, Nettuno e Plutone?';

  @override
  String get faq2Answer =>
      'Secondo questo approccio interpretativo, la costituzione energetica umana si articola su sette chakra che corrispondono a sette pianeti, dalla Luna a Saturno. Oltre questi, la costituzione umana semplicemente non ha canali ricettivi nei confronti di potenze planetarie superiori. Questi pianeti hanno comunque un impatto, ma di tipo generazionale: per esempio, Plutone in Scorpione (1983-1995) caratterizza un\'intera generazione. Sono più utili per studiare periodi storici che non individui, e quindi non vengono inclusi.';

  @override
  String get faq3Question =>
      'Perché i pianeti sono in Case diverse rispetto ad altre app?';

  @override
  String get faq3Answer =>
      'La domificazione è il metodo con cui si calcolano le dodici Case astrologiche. La maggior parte delle app usa Placido, che divide il cielo in base al tempo creando Case disuguali che variano per latitudine: alcune possono essere enormi, altre minuscole. Noi utilizziamo Vehlow, che divide lo zodiaco in dodici Case uguali di 30 gradi ciascuna. Non ha senso simbolico dividere l\'animo umano in parti disuguali: nessun ambito della vita è meno importante di un altro.';

  @override
  String get faq4Question => 'Perché l\'ora di nascita è importante?';

  @override
  String get faq4Answer =>
      'L\'Ascendente e le Case dipendono dall\'ora esatta di nascita. L\'intero tema ruota completamente in 24 ore. Senza l\'ora di nascita, possiamo analizzare solo le posizioni planetarie nei segni, perdendo metà del quadro simbolico: le Case che descrivono in quali ambiti della vita si manifestano le energie planetarie.';

  @override
  String get faq5Question => 'Qual è la fonte dei calcoli astrologici?';

  @override
  String get faq5Answer =>
      'Utilizziamo le Effemeridi Svizzere, le tavole astronomiche più precise al mondo. Sviluppate e mantenute da Astrodienst (astro.com), calcolano le posizioni planetarie esatte per qualsiasi data nella storia o nel futuro. Sono lo standard di riferimento per i software astrologici professionali.';

  @override
  String get faq6Question => 'Perché l\'Astrologia egizia?';

  @override
  String get faq6Answer =>
      'L\'Egitto è la matrice ermetica della cultura occidentale. L\'Astrologia oroscopica nacque ad Alessandria d\'Egitto, dove il faraone Nechepso e il sacerdote Petosiris scrissero i testi fondamentali (~150-120 a.C.) da cui tutti gli astrologi greci e romani hanno attinto. Tolomeo, autore del Tetrabiblos (fondamento dell\'Astrologia occidentale), lavorava ad Alessandria. Ermete Trismegisto, fusione del dio greco Hermes e del dio egizio Thoth, è considerato il fondatore di questa tradizione. L\'Astrologia egizia non è una variante: è la fonte originale.';

  @override
  String get faq7Question =>
      'Questa app sostituisce il confronto con un astrologo?';

  @override
  String get faq7Answer =>
      'No. Gli elementi astrologici hanno molteplici significati simbolici, e declinarli nell\'ambito di una determinata costituzione energetica richiede uno scambio tra anime, cuori e sensibilità. Un astrologo esperto può utilizzare AstroGods per semplificarsi il lavoro, ma da uno scambio personale sarà più in grado di far emergere i significati profondi. Inoltre, AstroGods al momento non tiene in considerazione tutto lo scibile astrologico: l\'astrologo esperto rimane insostituibile.';

  @override
  String get viewChart => 'Visualizza grafico';

  @override
  String get chartOnlyMode => 'Solo grafico, senza lettura';

  @override
  String get birthChartGraph => 'Grafico del tema natale';

  @override
  String get synastryGraph => 'Grafico della sinastria';

  @override
  String get dailyTransitGraph => 'Grafico del transito giornaliero';

  @override
  String get monthlyTransitGraph => 'Grafico del transito mensile';

  @override
  String get releaseNotes => 'Note di rilascio';

  @override
  String get releaseNotesTitle => 'Novità';

  @override
  String version(Object version) {
    return 'Versione $version';
  }

  @override
  String get releaseNotes_4_7_7 =>
      'Risolti errori nel calcolo dei transiti mensili. I badge degli abbonamenti ora si mostrano solo quando appropriato.';

  @override
  String get releaseNotes_4_7_6 => 'Migliorato il rendering dei font.';

  @override
  String get releaseNotes_4_7_1 =>
      'Messaggi di errore di connessione ora tradotti in italiano.';

  @override
  String get releaseNotes_4_5_1 =>
      'Nuove icone dell\'app. Migliorata la qualità del logo nel menu. Risolto un problema di validazione nella modifica del tema natale.';

  @override
  String get releaseNotes_4_0_1 =>
      'Risolto un problema per cui il pulsante PDF non appariva dopo la generazione della lettura. I grafici salvati ora si aggiornano correttamente tornando indietro con il browser.';

  @override
  String get releaseNotes_4_0_0 =>
      'Immagini ad alta risoluzione nella visualizzazione a schermo intero. Nuova griglia degli aspetti per sinastria e transiti. I PDF ora includono pagine con dettagli e griglia degli aspetti. Navigazione desktop migliorata con frecce, indicatori cliccabili e tasti direzionali. Zoom a schermo intero migliorato per grafici e immagini. App più leggera e veloce. Risolto problema di layout in modalità orizzontale su mobile.';

  @override
  String get releaseNotes_3_0_0 =>
      'Nuova schermata delle note di rilascio per visualizzare la cronologia delle versioni. L\'app ora verifica la compatibilità e ti avvisa quando è disponibile un aggiornamento. Migliorata la stabilità della generazione delle letture.';

  @override
  String get releaseNotes_2_4_0 =>
      'Le letture possono ora riprendere se la connessione viene interrotta. Stabilità generale migliorata.';

  @override
  String get releaseNotes_2_3_0 =>
      'Visualizzazione del grafico migliorata con indicatori di gradi e linee di connessione dei pianeti. Colori dei segni d\'acqua migliorati per un contrasto migliore. Perfezionamenti visivi al grafico.';

  @override
  String get releaseNotes_2_2_1 =>
      'Correzioni di bug e miglioramenti della stabilità.';

  @override
  String get releaseNotes_2_2_0 =>
      'Calcoli dei transiti più veloci, fino al 40% più rapidi per i transiti mensili. Nuovo membro del team: Corrado Camponeschi.';

  @override
  String get releaseNotes_2_1_0 =>
      'Download PDF solo grafico per tema natale, sinastria e transiti. Esportazione PDF per le letture dei transiti giornalieri e mensili. Numeri delle case ora mostrati nei dettagli del grafico. I temi natali creati prima della registrazione vengono ora collegati automaticamente al tuo account.';

  @override
  String get releaseNotes_2_0_4 =>
      'Correzioni di bug e miglioramenti della stabilità.';

  @override
  String get releaseNotes_2_0_3 => 'Miglioramenti delle prestazioni.';

  @override
  String get releaseNotes_2_0_2 =>
      'Correzioni di bug e miglioramenti della stabilità.';

  @override
  String get releaseNotes_2_0_1 =>
      'Rilascio iniziale con letture del tema natale, analisi di sinastria per la compatibilità di coppia, e previsioni dei transiti giornalieri e mensili. Esportazione PDF. Supporto completo per inglese e italiano.';

  @override
  String get updateRequired => 'Un attimo!';

  @override
  String get updateNow => 'Aggiorna';

  @override
  String get errorMessageCopied => 'Messaggio di errore copiato negli appunti';

  @override
  String get portalReturnTitle => 'Fatto';

  @override
  String get portalReturnMessage =>
      'Puoi chiudere questa finestra e tornare all\'app.';
}
