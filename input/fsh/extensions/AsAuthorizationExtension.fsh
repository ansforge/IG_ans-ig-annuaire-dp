Extension: 		AsAuthorizationExtension
Id: 			as-ext-authorization
Title:			"AS Authorization Extension"
Description:	"Extension créée dans le cadre de l'Annuaire Santé pour décrire les autorisations des activités (HealthcareService) sanitaires, sociales, médico-sociales et d'enseignement et des équipements matériels (Device) lourds autorisés."

* ^context[0].type = #element
* ^context[0].expression = "HealthcareService"

* ^context[1].type = #element
* ^context[1].expression = "Device"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open

* extension contains
    // dateAuthorization 0..1 and 		// dateDecision
	periodAuthorization 0..1 and 		// date de début et de fin d'autorisation (=DATEAUTOR DT_AUTORISAT) + dateFin  (=DATEFIN / DT_FIN)
	dateUpdateAuthorization 0..1 and 	// dateMajAutorisation (DT_MAJ_SUR_ACT)
	deletedAuthorization 0..1 		    // suppressionAutorisation

// Supprimé car pas connu par FINESS
// * extension[dateAuthorization].value[x] only date    
// * extension[dateAuthorization] ^short = "Date de délivrance de l’autorisation."

* extension[periodAuthorization].value[x] only Period
* extension[periodAuthorization].valuePeriod.start ^short = "Date de début de l'autorisation."
* extension[periodAuthorization].valuePeriod.end ^short = "Date de fin de l'autorisation."

* extension[dateUpdateAuthorization].value[x] only date    
* extension[dateUpdateAuthorization] ^short = "Date de dernière mise à jour de l’autorisation. Celle-ci n'a de sens que dans le cadre de l'équipement social et pas dans le cas de l'activité."

* extension[deletedAuthorization].value[x] only boolean    
* extension[deletedAuthorization] ^short = "Indicateur de suppression de l'autorisation."