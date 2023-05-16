Profile: 		ASPractitionerRoleProfile
Parent: 		FrPractitionerRoleExercice
Id: 			as-practitionerrole
Title:			"AS PractitionerRole Profile"
Description: 	"Profil créé à partir de la ressource PractitionerRole dans le contexte de l'Annuaire Santé pour décrire l'exercice professionel et la situation d'exercice | contient les informations décrivant notamment la profession exercée, l'identité d'exercice d'un professionnel, le cadre de son exercice (civil, militaire, etc.) ainsi que les caractéristiques de l'exercice d’un professionnel pendant une période déterminée et dans une structure déterminée."
/* profils refences */
* practitioner MS 
* organization MS
* location MS
* healthcareService MS

/* extensions */
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    AsPractitionerRoleNameExtension named as-ext-practitionerrole-name 0..1 MS and
    AsPractitionerRoleRegistrationExtension named as-ext-practitionerrole-registration 0..* MS and
    AsPractitionerRoleEducationLevelExtension named as-ext-practitionerrole-education-level 0..1 MS and
    AsPractitionerRoleSmartCardExtension named as-ext-practitionerrole-smartcard 0..1 MS

/* Donnees metiers */
// civiliteExercie + nomExercice + prenomExercice (ExerciceProfessionnel)
* extension[as-ext-practitionerrole-name] ^short = "civiliteExercie + nomExercice + prenomExercice (ExerciceProfessionnel)"

// AutoriteEnregistrement
* extension[as-ext-practitionerrole-registration] ^short = "Autorité d'enregistrement représentant une institution (Ordre/ARS)."
* extension[as-ext-practitionerrole-registration] ^comment = "Synonyme : AutoriteEnregistrement, Ordre"

// SavoirFaire
* extension[as-ext-practitionerrole-education-level] ^comment = "Synonyme MOS : SavoirFaire"
* extension[as-ext-practitionerrole-education-level] ^short = "Savoir-faire (qualifications/autres attributions)."

// CarteProfessionnel
* extension[as-ext-practitionerrole-smartcard] ^short = "Numéro de carte du professionnel."
* extension[as-ext-practitionerrole-smartcard] ^comment = "Synonyme MOS : CarteProfessionnel"

/* PractitionerRole.identifier */
* identifier MS
* identifier ^comment = "Synonyme MOS : idFonctionnel"
* identifier ^short = "identifiant métier calculé à partir des identifiants techniques de l'exercice professionnel et la situation d'exercice."

// PractitionerRole.identifier.value
* identifier.value ^comment = "Synonyme : idActivite"
* identifier.value ^short = "Identifiant technique de l'activité." 

// PractitionerRole.identifier.system
* identifier.system ^short = "system (https://annuaire.sante.fr par défaut)." 

// PractitionerRole.active
* active MS
* active ^short = "La sitation d'exercice est-elle active? (active | inactive)"
* active ^comment = "true par défaut; false pour les situations d’exercices supprimées"

/* PractitionerRole.period */ 
* period MS
* period ^short = "Période d'activité de la situation d'exercice."

// dateDebutActivite
* period.start ^short = "[Donnée restreinte] : Date de début de l’activité correspondant à la date d’installation en cabinet ou à la date d’embauche du salarié."
* period.start ^comment = "Synonyme MOS : dateDebutActivite"

// dateFinActivite
* period.end ^short = "[Donnée restreinte] : Date de fin de l’activité."
* period.end ^comment = "Synonyme : dateFinActivite"

// PractitionerRole.practitioner
* practitioner ^comment = "Synonyme : idPP"
* practitioner ^short = "Référence permettant de lier l’exercice professionnel et la situation d'exercice à un professionnel (Practitioner)."

// PractitionerRole.organization
* organization ^comment = "Synonyme : idNat_Strcut"
* organization ^short = "Référence vers l’EG ou EJ de rattachement de la situation d’exercice (Organization)"

// Slicing au niveau de PractitionerRole.code.coding
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains
	CategorieProfession 0..1 MS and
	professionG15 0..1 MS  and
	professionR94 0..1 MS  and
	professionR95 0..1 MS  and
	professionR291 0..1 MS and
    genreActivite 0..1 MS  and
    modeExercice 0..1 MS  and
    typeActiviteLiberale 0..1 MS and
    statutProfessionnelSSA 0..1 MS and
    statutHospitalier 0..1 MS and
    fonctionR21 0..1 MS and
    fonctionR96 0..1 MS and
    fonctionR85 0..1 MS and
    metierPharmacienR06 0..1 MS and
    metierPharmacienG05 0..1 MS

// Slice 1 : categorie profession
* code.coding[CategorieProfession] ^short = "Catégorie professionnelle indiqant si le professionnel exerce sa profession en tant que Militaire, Civil, Fonctionnaire ou Etudiant."
* code.coding[CategorieProfession] ^comment = "Synonyme : categorieProfessionnelle"
* code.coding[CategorieProfession] from $JDV-J89-CategorieProfessionnelle-RASS (required)
* code.coding[CategorieProfession] ^binding.description = "Liste des catégories professionnelles"

// Slice 2 : profession de sante
* code.coding[professionG15] ^short = "Profession exercée ou future profession de l'étudiant."
* code.coding[professionG15] ^comment = "Synonyme : professionSante"
* code.coding[professionG15] from $JDV-J106-EnsembleProfession-RASS (required)
* code.coding[professionG15] ^binding.description = "Liste des professions de santé  définies par le code de la santé publique"

// Slice 3 : profession sociale
* code.coding[professionR94] ^comment = "Synonyme : professionSocial"
* code.coding[professionR94] ^short = "Profession du social."
* code.coding[professionR94] from $JDV-J106-EnsembleProfession-RASS (required)
* code.coding[professionR94] ^binding.description = "Liste des professions du social"

// Slice 4 : usage de titre professionnel
* code.coding[professionR95] ^comment = "Synonyme : usagerTitre"
* code.coding[professionR95] ^short = "Profession à usage de titre professionnel."
* code.coding[professionR95] from $JDV-J106-EnsembleProfession-RASS (required)
* code.coding[professionR95] ^binding.description = "Liste des professions à usage de titre professionnel"

// Slice 5 : autre profession
* code.coding[professionR291] ^comment = "Synonyme : autreProfession"
* code.coding[professionR291] ^short = "professionnel non membre d'une profession réglementée."
* code.coding[professionR291] from $JDV-J106-EnsembleProfession-RASS (required)
* code.coding[professionR291] ^binding.description = "Liste de professionnels non membres d'une profession réglementée"

// Slice 6 : genre activite
* code.coding[genreActivite] ^short = "Le genre identifiant une activité qui nécessite l’application de règles de gestion spécifiques."
* code.coding[genreActivite] ^comment = "Synonyme : genreActivite"
* code.coding[genreActivite] from $JDV-J94-GenreActivite-RASS (required)
* code.coding[genreActivite] ^binding.description = "Liste des genres d'activité"

// Slice 7 : mode exercice  
* code.coding[modeExercice] ^comment = "Synonyme : modeExercice"
* code.coding[modeExercice] ^short = "Le mode d'exercice décrit selon quelle modalité une activité est exercée au regard de l'organisation de la rétribution du professionnel."
* code.coding[modeExercice] from $JDV-J95-ModeExercice-RASS (required)
* code.coding[modeExercice] ^binding.description = "Liste des modes d'exercice"

// Slice 8 : type activite liberale
* code.coding[typeActiviteLiberale] from $JDV-J96-TypeActiviteLiberale-RASS (required)
* code.coding[typeActiviteLiberale] ^binding.description = "Liste des types d’activité"
* code.coding[typeActiviteLiberale] ^comment = "Synonyme : typeActiviteLiberale"
* code.coding[typeActiviteLiberale] ^short = "Type d’activité libérale, par exemple: Cabinet; Secteur privé à l'hôpital."

// Slice 9 : statut des PS du SSA  
* code.coding[statutProfessionnelSSA] ^comment = "Synonyme : statutProfessionnelSSA"
* code.coding[statutProfessionnelSSA] ^short = "Statut du professionnel du Service de santé des armées."
* code.coding[statutProfessionnelSSA] from $JDV-J97-StatutProfessionnelSSA-RASS (required)
* code.coding[statutProfessionnelSSA] ^binding.description = "Liste des statuts SSA"

// Slice 10 : statut hospitalier 
* code.coding[statutHospitalier] ^comment = "Synonyme : statutHospitalier"
* code.coding[statutHospitalier] ^short = "Statut hospitalier dans le cas d’une activité exercée en établissement public de santé."
* code.coding[statutHospitalier] from $JDV-J98-StatutHospitalier-RASS (required)
* code.coding[statutHospitalier] ^binding.description = "Liste des statuts hospitaliers"

// Slice 11 : fonction
* code.coding[fonctionR21] ^comment = "Synonyme : role"
* code.coding[fonctionR21] ^short = "Fonction du professionnel au sein de la structure d’exercice."
* code.coding[fonctionR21] from $JDV-J108-EnsembleFonction-RASS (required)
* code.coding[fonctionR21] ^binding.description = "Liste des fonctions et rôles"

// Slice 12 : autreFonctionSanitaire
* code.coding[fonctionR96] ^comment = "Synonyme : role"
* code.coding[fonctionR96] ^short = "Autre fonction du domaine sanitaire exercée par le professionnel au sein de la structure d’exercice."
* code.coding[fonctionR96] from $JDV-J108-EnsembleFonction-RASS (required)
* code.coding[fonctionR96] ^binding.description = "Liste des fonctions et rôles"

// Slice 13 : role prise en charge
* code.coding[fonctionR85] ^comment = "Synonyme : role"
* code.coding[fonctionR85] ^short = "Rôle du professionnel dans la prise en charge des patients ou des usagers."
* code.coding[fonctionR85] from $JDV-J108-EnsembleFonction-RASS (required)
* code.coding[fonctionR85] ^binding.description = "Liste des rôles"

// Slice 14 : section tableau pharmaciens 
* code.coding[metierPharmacienR06] ^comment = "Synonyme : sectionOrdrePharmacien"
* code.coding[metierPharmacienR06] ^short = "Section du tableau de l’Ordre des pharmaciens (CNOP)." 
* code.coding[metierPharmacienR06] from $JDV-J73-MetierPharmacien-RASS (required)
* code.coding[metierPharmacienR06] ^binding.description = "Liste des sections du tableau CNOP"

// Slice 15 : sous section tableau pharmaciens  
* code.coding[metierPharmacienG05] ^comment = "Synonyme : sousSectionOrdrePharmacien"
* code.coding[metierPharmacienG05] ^short = "Sous-section ou à défaut section du tableau de l’Ordre des pharmaciens (CNOP)."
* code.coding[metierPharmacienG05] from $JDV-J73-MetierPharmacien-RASS (required)
* code.coding[metierPharmacienG05] ^binding.description = "Liste des sous-sections du tableau CNOP"

/* Slicing pour separer savoir-faire et attribution particuliere */
* specialty only as-codeableconcept-timed
* specialty ^slicing.discriminator.type = #value
* specialty ^slicing.discriminator.path = "coding.system"
* specialty ^slicing.description = "Slicing pour séparer savoir-faire et attribution particulière"
* specialty ^slicing.rules = #open
* specialty contains
    attributionParticuliere 0..* MS and
    savoirFaireR38 0..* MS and
    savoirFaireR39 0..* MS and
    savoirFaireR40 0..* MS and
    savoirFaireR42 0..* MS and
    savoirFaireR43 0..* MS and
    savoirFaireR44 0..* MS and
    savoirFaireR45 0..* MS and
    savoirFaireR97 0..* MS and
    savoirFaireG13 0..* MS and
    typeSavoirFaire 0..* MS

/* Slice A : attribution particuliere */
* specialty[attributionParticuliere] ^short = "Activité ponctuelle du professionnel de type expertise."
* specialty[attributionParticuliere] ^comment = "Synonyme : attributionParticuliere"
* specialty[attributionParticuliere] from $JDV-J90-AttributionParticuliere-RASS (required)

/* Slice B : savoir-faire */

// Slice B1 : specialiteOrdinal
* specialty[savoirFaireR38] ^comment = "Synonyme : specialite"
* specialty[savoirFaireR38] ^short = "Spécialité ordinale  reconnue par une autorité d'enregistrement (Ordre ou SSA)."
* specialty[savoirFaireR38] from $JDV-J107-EnsembleSavoirFaire-RASS (required)
* specialty[savoirFaireR38] ^binding.description = "Liste des spécialités ordinales"

// Slice B2 : competence
* specialty[savoirFaireR39] ^comment = "Synonyme : competence"
* specialty[savoirFaireR39] ^short = "Compétence acquise par le professionnel."
* specialty[savoirFaireR39] from $JDV-J107-EnsembleSavoirFaire-RASS (required)
* specialty[savoirFaireR39] ^binding.description = "Liste des compétences"

// Slice B3 : competenceExclusive
* specialty[savoirFaireR40] ^comment = "Synonyme : competenceExclusive"
* specialty[savoirFaireR40] ^short = "Compétence exclusive exercée par le professionnel à titre exclusif."
* specialty[savoirFaireR40] from $JDV-J107-EnsembleSavoirFaire-RASS (required)
* specialty[savoirFaireR40] ^binding.description = "Liste des compétences exclusives"

// Slice B4 : DESCnonQualifian
* specialty[savoirFaireR42] ^comment = "Synonyme : DESCnonQualifian"
* specialty[savoirFaireR42] ^short = "Diplôme d'études spécialisées complémentaires (DESC)."
* specialty[savoirFaireR42] from $JDV-J107-EnsembleSavoirFaire-RASS (required)
* specialty[savoirFaireR42] ^binding.description = "Liste des DESC"

// Slice B5 : capaciteSavoirFaire
* specialty[savoirFaireR43] ^comment = "Synonyme : capaciteSavoirFaire"
* specialty[savoirFaireR43] ^short = "Capacité (savoir-faire)d e médecine"
* specialty[savoirFaireR43] from $JDV-J107-EnsembleSavoirFaire-RASS (required)
* specialty[savoirFaireR43] ^binding.description = "Liste des capacités"

// Slice B6 : qualificationPAC
* specialty[savoirFaireR44] ^comment = "Synonyme : qualificationPAC"
* specialty[savoirFaireR44] ^short = "Qualification de praticien adjoint contractuel."
* specialty[savoirFaireR44] from $JDV-J107-EnsembleSavoirFaire-RASS (required)
* specialty[savoirFaireR44] ^binding.description = "Liste des qualifications"

// Slice B7 : fonctionQualifiee
* specialty[savoirFaireR45] ^comment = "Synonyme : fonctionQualifiee"
* specialty[savoirFaireR45] ^short = "Fonction qualifiée."
* specialty[savoirFaireR45] from $JDV-J107-EnsembleSavoirFaire-RASS (required)
* specialty[savoirFaireR45] ^binding.description = "Liste des fonctions qualifiées"

// Slice B8 : droitExerciceComplementaire
* specialty[savoirFaireR97] ^comment = "Synonyme : droitExerciceComplementaire"
* specialty[savoirFaireR97] ^short = "Droit d'exercice complémentaire."
* specialty[savoirFaireR97] from $JDV-J107-EnsembleSavoirFaire-RASS (required)
* specialty[savoirFaireR97] ^binding.description = "Liste des droits d'exercice complémentaires"

// Slice B9 : orientationParticuliere
* specialty[savoirFaireG13] ^comment = "Synonyme : orientationParticuliere"
* specialty[savoirFaireG13] ^short = "Orientation particulière."
* specialty[savoirFaireG13] from $JDV-J107-EnsembleSavoirFaire-RASS (required)
* specialty[savoirFaireG13] ^binding.description = "Liste des orientations particulières"

// Slice B10 : typeSavoirFaire
* specialty[typeSavoirFaire] ^comment = "Synonyme : typeSavoirFaire"
* specialty[typeSavoirFaire] ^short = "Le type de savoir-faire (qualifications/autres attributions)."
* specialty[typeSavoirFaire] from $JDV-J91-TypeSavoirFaire-RASS (required)
* specialty[typeSavoirFaire] ^binding.description = "Liste des types de savoir-faire"

// PractitionerRole.location
* location MS
* location ^comment = "idLocation"
* location ^short = "Référence vers la location dans PractitionerRole.contained représentant les coordonnées de l'activité."

// telecom - PractitionerRole.telecom
* telecom MS
* telecom only $FrContactPoint

// BoiteLettreMSS - Extension
* telecom ^slicing.rules = #open
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "code"

* telecom contains mailbox-mss 0..*
* telecom[mailbox-mss] only as-mailbox-mss
* telecom[mailbox-mss] ^short = "BALs MSS de type PER rattachés à l'identifiant du professionnel de santé  ainsi qu'au lieu de sa situation d'exercice."
* telecom[mailbox-mss] ^comment = "Synonyme : BoiteLettreMSS"

// PractitionerRole.availableTime
* availableTime MS

// PractitionerRole.notAvailable
* notAvailable MS

// PractitionerRole.availabilityExceptions
* availabilityExceptions MS

// PractitionerRole.endpoint
* endpoint MS
