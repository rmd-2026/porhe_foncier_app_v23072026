library porhe_foncier23072026;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

part 'seed_regions.dart';

part 'seed_communes.dart';

part 'seed_sous_prefectures.dart';

part 'upsert_utilisateur_par_firebase_uid.dart';

part 'mettre_a_jour_profil.dart';

part 'assigner_role_utilisateur_par_defaut.dart';

part 'assigner_role_global.dart';

part 'assigner_role_commune.dart';

part 'valider_utilisateur.dart';

part 'desactiver_utilisateur.dart';

part 'enregistrer_audit.dart';

part 'creer_parcelle.dart';

part 'mettre_a_jour_parcelle.dart';

part 'valider_parcelle.dart';

part 'rejeter_parcelle.dart';

part 'rejeter_parcelle_avec_motif.dart';

part 'resoumettre_parcelle.dart';

part 'transferer_parcelle_entre_communes.dart';

part 'supprimer_parcelle.dart';

part 'creer_transaction.dart';

part 'valider_transaction.dart';

part 'rejeter_transaction_avec_motif.dart';

part 'resoumettre_transaction.dart';

part 'ajouter_document.dart';

part 'supprimer_document.dart';

part 'creer_taxe_fonciere.dart';

part 'marquer_taxe_payee.dart';

part 'marquer_taxe_en_retard.dart';

part 'mettre_a_jour_taxe_fonciere.dart';

part 'annuler_taxe.dart';

part 'supprimer_taxe_fonciere.dart';

part 'ajouter_suivi_visuel.dart';

part 'supprimer_suivi_visuel.dart';

part 'creer_abonnement.dart';

part 'renouveler_abonnement.dart';

part 'annuler_abonnement.dart';

part 'mettre_a_jour_abonnement.dart';

part 'supprimer_abonnement.dart';

part 'enregistrer_paiement.dart';

part 'confirmer_paiement.dart';

part 'confirmer_paiement_taxe.dart';

part 'confirmer_paiement_abonnement.dart';

part 'annuler_paiement.dart';

part 'creer_alerte.dart';

part 'marquer_alerte_lue.dart';

part 'supprimer_alerte.dart';

part 'signaler_litige.dart';

part 'passer_litige_en_examen.dart';

part 'resoudre_litige.dart';

part 'rejeter_litige.dart';

part 'supprimer_litige.dart';

part 'creer_frais_enregistrement.dart';

part 'marquer_frais_paye.dart';

part 'annuler_frais.dart';

part 'rejeter_frais.dart';

part 'supprimer_frais_enregistrement.dart';

part 'lister_regions.dart';

part 'lister_communes.dart';

part 'lister_communes_par_region.dart';

part 'lister_sous_prefectures.dart';

part 'lister_sous_prefectures_par_commune.dart';

part 'obtenir_profil_par_firebase_uid.dart';

part 'est_profil_incomplet.dart';

part 'lister_utilisateurs_par_statut_compte.dart';

part 'obtenir_utilisateur_par_id.dart';

part 'lister_tous_utilisateurs.dart';

part 'obtenir_role_par_utilisateur_id.dart';

part 'verifier_appartenance_commune.dart';

part 'lister_audit_toutes.dart';

part 'lister_audit_par_acteur.dart';

part 'lister_audit_par_commune.dart';

part 'lister_audit_par_type_entite.dart';

part 'lister_historique_rejets_et_suppressions.dart';

part 'obtenir_parcelle_par_id.dart';

part 'obtenir_parcelle_par_qr_code.dart';

part 'lister_parcelles_par_utilisateur.dart';

part 'lister_parcelles_par_commune.dart';

part 'lister_parcelles_par_statut.dart';

part 'lister_parcelles_rejetees_par_commune.dart';

part 'lister_parcelles_dans_zone.dart';

part 'rechercher_parcelles.dart';

part 'lister_toutes_parcelles.dart';

part 'obtenir_transaction_par_id.dart';

part 'lister_transactions_par_parcelle.dart';

part 'lister_transactions_par_utilisateur.dart';

part 'lister_transactions_en_attente_par_commune.dart';

part 'lister_transactions_rejetees_par_commune.dart';

part 'obtenir_historique_propriete.dart';

part 'lister_toutes_transactions.dart';

part 'obtenir_document_par_id.dart';

part 'lister_documents_par_parcelle.dart';

part 'lister_tous_documents.dart';

part 'obtenir_taxe_par_id.dart';

part 'lister_taxes_par_parcelle.dart';

part 'lister_taxes_en_retard_par_commune.dart';

part 'lister_taxes_echeance_depassee.dart';

part 'obtenir_rapport_financier_commune.dart';

part 'lister_toutes_taxes.dart';

part 'lister_suivi_visuel_par_parcelle.dart';

part 'lister_suivi_visuel_recent_par_parcelle.dart';

part 'lister_suivi_visuel_complet_par_parcelle.dart';

part 'obtenir_contexte_acces_suivi_visuel.dart';

part 'obtenir_uploads_recents_pour_abonnement.dart';

part 'obtenir_abonnement_actif_par_utilisateur.dart';

part 'lister_abonnements_par_utilisateur.dart';

part 'lister_abonnements_actifs_toutes.dart';

part 'lister_tous_abonnements.dart';

part 'obtenir_paiement_par_id.dart';

part 'lister_paiements_par_utilisateur.dart';

part 'lister_paiements_taxe_en_attente_par_commune.dart';

part 'lister_paiements_abonnement_en_attente.dart';

part 'lister_tous_paiements.dart';

part 'obtenir_alerte_par_id.dart';

part 'lister_alertes_par_utilisateur.dart';

part 'lister_alertes_non_lues_par_utilisateur.dart';

part 'lister_toutes_alertes.dart';

part 'obtenir_litige_par_id.dart';

part 'lister_litiges_par_parcelle.dart';

part 'lister_litiges_ouverts_par_commune.dart';

part 'lister_tous_litiges.dart';

part 'obtenir_frais_par_id.dart';

part 'lister_frais_par_parcelle.dart';

part 'lister_frais_en_attente_par_commune.dart';

part 'lister_tous_frais.dart';

part 'obtenir_statistiques_commune.dart';

part 'obtenir_chronologie_parcelle.dart';



  enum Civilite {
    
      MONSIEUR,
    
      MADAME,
    
      MADEMOISELLE,
    
  }
  
  String civiliteSerializer(EnumValue<Civilite> e) {
    return e.stringValue;
  }
  EnumValue<Civilite> civiliteDeserializer(dynamic data) {
    switch (data) {
      
      case 'MONSIEUR':
        return const Known(Civilite.MONSIEUR);
      
      case 'MADAME':
        return const Known(Civilite.MADAME);
      
      case 'MADEMOISELLE':
        return const Known(Civilite.MADEMOISELLE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum MethodePaiement {
    
      ORANGE_MONEY,
    
      MTN_MOMO,
    
      AUTRE,
    
  }
  
  String methodePaiementSerializer(EnumValue<MethodePaiement> e) {
    return e.stringValue;
  }
  EnumValue<MethodePaiement> methodePaiementDeserializer(dynamic data) {
    switch (data) {
      
      case 'ORANGE_MONEY':
        return const Known(MethodePaiement.ORANGE_MONEY);
      
      case 'MTN_MOMO':
        return const Known(MethodePaiement.MTN_MOMO);
      
      case 'AUTRE':
        return const Known(MethodePaiement.AUTRE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum NiveauAbonnement {
    
      BASIQUE,
    
      STANDARD,
    
      PREMIUM,
    
  }
  
  String niveauAbonnementSerializer(EnumValue<NiveauAbonnement> e) {
    return e.stringValue;
  }
  EnumValue<NiveauAbonnement> niveauAbonnementDeserializer(dynamic data) {
    switch (data) {
      
      case 'BASIQUE':
        return const Known(NiveauAbonnement.BASIQUE);
      
      case 'STANDARD':
        return const Known(NiveauAbonnement.STANDARD);
      
      case 'PREMIUM':
        return const Known(NiveauAbonnement.PREMIUM);
      
      default:
        return Unknown(data);
    }
  }
  

  enum NomRole {
    
      AGENT,
    
      ADMIN_COMMUNE,
    
      ADMIN_GLOBAL,
    
      PROPRIETAIRE,
    
  }
  
  String nomRoleSerializer(EnumValue<NomRole> e) {
    return e.stringValue;
  }
  EnumValue<NomRole> nomRoleDeserializer(dynamic data) {
    switch (data) {
      
      case 'AGENT':
        return const Known(NomRole.AGENT);
      
      case 'ADMIN_COMMUNE':
        return const Known(NomRole.ADMIN_COMMUNE);
      
      case 'ADMIN_GLOBAL':
        return const Known(NomRole.ADMIN_GLOBAL);
      
      case 'PROPRIETAIRE':
        return const Known(NomRole.PROPRIETAIRE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum StatutAbonnement {
    
      ACTIF,
    
      EXPIRE,
    
      ANNULE,
    
  }
  
  String statutAbonnementSerializer(EnumValue<StatutAbonnement> e) {
    return e.stringValue;
  }
  EnumValue<StatutAbonnement> statutAbonnementDeserializer(dynamic data) {
    switch (data) {
      
      case 'ACTIF':
        return const Known(StatutAbonnement.ACTIF);
      
      case 'EXPIRE':
        return const Known(StatutAbonnement.EXPIRE);
      
      case 'ANNULE':
        return const Known(StatutAbonnement.ANNULE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum StatutCompte {
    
      NON_VERIFIE,
    
      ACTIF,
    
      DESACTIVE,
    
  }
  
  String statutCompteSerializer(EnumValue<StatutCompte> e) {
    return e.stringValue;
  }
  EnumValue<StatutCompte> statutCompteDeserializer(dynamic data) {
    switch (data) {
      
      case 'NON_VERIFIE':
        return const Known(StatutCompte.NON_VERIFIE);
      
      case 'ACTIF':
        return const Known(StatutCompte.ACTIF);
      
      case 'DESACTIVE':
        return const Known(StatutCompte.DESACTIVE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum StatutLitige {
    
      OUVERT,
    
      EN_COURS_EXAMEN,
    
      RESOLU,
    
      REJETE,
    
  }
  
  String statutLitigeSerializer(EnumValue<StatutLitige> e) {
    return e.stringValue;
  }
  EnumValue<StatutLitige> statutLitigeDeserializer(dynamic data) {
    switch (data) {
      
      case 'OUVERT':
        return const Known(StatutLitige.OUVERT);
      
      case 'EN_COURS_EXAMEN':
        return const Known(StatutLitige.EN_COURS_EXAMEN);
      
      case 'RESOLU':
        return const Known(StatutLitige.RESOLU);
      
      case 'REJETE':
        return const Known(StatutLitige.REJETE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum StatutPaiement {
    
      EN_ATTENTE,
    
      PAYE,
    
      EN_RETARD,
    
      ANNULE,
    
      REJETE,
    
  }
  
  String statutPaiementSerializer(EnumValue<StatutPaiement> e) {
    return e.stringValue;
  }
  EnumValue<StatutPaiement> statutPaiementDeserializer(dynamic data) {
    switch (data) {
      
      case 'EN_ATTENTE':
        return const Known(StatutPaiement.EN_ATTENTE);
      
      case 'PAYE':
        return const Known(StatutPaiement.PAYE);
      
      case 'EN_RETARD':
        return const Known(StatutPaiement.EN_RETARD);
      
      case 'ANNULE':
        return const Known(StatutPaiement.ANNULE);
      
      case 'REJETE':
        return const Known(StatutPaiement.REJETE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum StatutParcelle {
    
      EN_ATTENTE_VALIDATION,
    
      VALIDEE,
    
      REJETEE,
    
  }
  
  String statutParcelleSerializer(EnumValue<StatutParcelle> e) {
    return e.stringValue;
  }
  EnumValue<StatutParcelle> statutParcelleDeserializer(dynamic data) {
    switch (data) {
      
      case 'EN_ATTENTE_VALIDATION':
        return const Known(StatutParcelle.EN_ATTENTE_VALIDATION);
      
      case 'VALIDEE':
        return const Known(StatutParcelle.VALIDEE);
      
      case 'REJETEE':
        return const Known(StatutParcelle.REJETEE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum StatutTransaction {
    
      EN_ATTENTE_VALIDATION,
    
      VALIDEE,
    
      REJETEE,
    
  }
  
  String statutTransactionSerializer(EnumValue<StatutTransaction> e) {
    return e.stringValue;
  }
  EnumValue<StatutTransaction> statutTransactionDeserializer(dynamic data) {
    switch (data) {
      
      case 'EN_ATTENTE_VALIDATION':
        return const Known(StatutTransaction.EN_ATTENTE_VALIDATION);
      
      case 'VALIDEE':
        return const Known(StatutTransaction.VALIDEE);
      
      case 'REJETEE':
        return const Known(StatutTransaction.REJETEE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum TypeAlerte {
    
      ACTIVITE_SUSPECTE,
    
      ECHEANCE_TAXE,
    
      NOUVELLE_TRANSACTION,
    
      SUIVI_VISUEL,
    
      AUTRE,
    
  }
  
  String typeAlerteSerializer(EnumValue<TypeAlerte> e) {
    return e.stringValue;
  }
  EnumValue<TypeAlerte> typeAlerteDeserializer(dynamic data) {
    switch (data) {
      
      case 'ACTIVITE_SUSPECTE':
        return const Known(TypeAlerte.ACTIVITE_SUSPECTE);
      
      case 'ECHEANCE_TAXE':
        return const Known(TypeAlerte.ECHEANCE_TAXE);
      
      case 'NOUVELLE_TRANSACTION':
        return const Known(TypeAlerte.NOUVELLE_TRANSACTION);
      
      case 'SUIVI_VISUEL':
        return const Known(TypeAlerte.SUIVI_VISUEL);
      
      case 'AUTRE':
        return const Known(TypeAlerte.AUTRE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum TypeDocument {
    
      TITRE_FONCIER,
    
      ACTE_VENTE,
    
      CERTIFICAT_HERITAGE,
    
      PLAN_CADASTRAL,
    
      AUTRE,
    
  }
  
  String typeDocumentSerializer(EnumValue<TypeDocument> e) {
    return e.stringValue;
  }
  EnumValue<TypeDocument> typeDocumentDeserializer(dynamic data) {
    switch (data) {
      
      case 'TITRE_FONCIER':
        return const Known(TypeDocument.TITRE_FONCIER);
      
      case 'ACTE_VENTE':
        return const Known(TypeDocument.ACTE_VENTE);
      
      case 'CERTIFICAT_HERITAGE':
        return const Known(TypeDocument.CERTIFICAT_HERITAGE);
      
      case 'PLAN_CADASTRAL':
        return const Known(TypeDocument.PLAN_CADASTRAL);
      
      case 'AUTRE':
        return const Known(TypeDocument.AUTRE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum TypeFrais {
    
      INSCRIPTION_PARCELLE,
    
      DUPLICATA_DOCUMENT,
    
      AUTRE,
    
  }
  
  String typeFraisSerializer(EnumValue<TypeFrais> e) {
    return e.stringValue;
  }
  EnumValue<TypeFrais> typeFraisDeserializer(dynamic data) {
    switch (data) {
      
      case 'INSCRIPTION_PARCELLE':
        return const Known(TypeFrais.INSCRIPTION_PARCELLE);
      
      case 'DUPLICATA_DOCUMENT':
        return const Known(TypeFrais.DUPLICATA_DOCUMENT);
      
      case 'AUTRE':
        return const Known(TypeFrais.AUTRE);
      
      default:
        return Unknown(data);
    }
  }
  

  enum TypeMedia {
    
      PHOTO,
    
      VIDEO,
    
  }
  
  String typeMediaSerializer(EnumValue<TypeMedia> e) {
    return e.stringValue;
  }
  EnumValue<TypeMedia> typeMediaDeserializer(dynamic data) {
    switch (data) {
      
      case 'PHOTO':
        return const Known(TypeMedia.PHOTO);
      
      case 'VIDEO':
        return const Known(TypeMedia.VIDEO);
      
      default:
        return Unknown(data);
    }
  }
  

  enum TypePieceIdentite {
    
      CIN,
    
      PASSEPORT,
    
  }
  
  String typePieceIdentiteSerializer(EnumValue<TypePieceIdentite> e) {
    return e.stringValue;
  }
  EnumValue<TypePieceIdentite> typePieceIdentiteDeserializer(dynamic data) {
    switch (data) {
      
      case 'CIN':
        return const Known(TypePieceIdentite.CIN);
      
      case 'PASSEPORT':
        return const Known(TypePieceIdentite.PASSEPORT);
      
      default:
        return Unknown(data);
    }
  }
  

  enum TypeTransaction {
    
      VENTE,
    
      HERITAGE,
    
      DONATION,
    
      ECHANGE,
    
  }
  
  String typeTransactionSerializer(EnumValue<TypeTransaction> e) {
    return e.stringValue;
  }
  EnumValue<TypeTransaction> typeTransactionDeserializer(dynamic data) {
    switch (data) {
      
      case 'VENTE':
        return const Known(TypeTransaction.VENTE);
      
      case 'HERITAGE':
        return const Known(TypeTransaction.HERITAGE);
      
      case 'DONATION':
        return const Known(TypeTransaction.DONATION);
      
      case 'ECHANGE':
        return const Known(TypeTransaction.ECHANGE);
      
      default:
        return Unknown(data);
    }
  }
  



String enumSerializer(Enum e) {
  return e.name;
}



/// A sealed class representing either a known enum value or an unknown string value.
@immutable
sealed class EnumValue<T extends Enum> {
  const EnumValue();

  

  /// The string representation of the value.
  String get stringValue;
  @override
  String toString() {
    return "EnumValue($stringValue)";
  }
}

/// Represents a known, valid enum value.
class Known<T extends Enum> extends EnumValue<T> {
  /// The actual enum value.
  final T value;

  const Known(this.value);

  @override
  String get stringValue => value.name;

  @override
  String toString() {
    return "Known($stringValue)";
  }
}
/// Represents an unknown or unrecognized enum value.
class Unknown extends EnumValue<Never> {
  /// The raw string value that couldn't be mapped to a known enum.
  @override
  final String stringValue;

  const Unknown(this.stringValue);
  @override
  String toString() {
    return "Unknown($stringValue)";
  }
}

class PorheFoncier23072026Connector {
  
  
  SeedRegionsVariablesBuilder seedRegions () {
    return SeedRegionsVariablesBuilder(dataConnect, );
  }
  
  
  SeedCommunesVariablesBuilder seedCommunes () {
    return SeedCommunesVariablesBuilder(dataConnect, );
  }
  
  
  SeedSousPrefecturesVariablesBuilder seedSousPrefectures () {
    return SeedSousPrefecturesVariablesBuilder(dataConnect, );
  }
  
  
  UpsertUtilisateurParFirebaseUidVariablesBuilder upsertUtilisateurParFirebaseUid ({required String firebaseUid, }) {
    return UpsertUtilisateurParFirebaseUidVariablesBuilder(dataConnect, firebaseUid: firebaseUid,);
  }
  
  
  MettreAJourProfilVariablesBuilder mettreAJourProfil ({required String firebaseUid, }) {
    return MettreAJourProfilVariablesBuilder(dataConnect, firebaseUid: firebaseUid,);
  }
  
  
  AssignerRoleUtilisateurParDefautVariablesBuilder assignerRoleUtilisateurParDefaut ({required int utilisateurId, }) {
    return AssignerRoleUtilisateurParDefautVariablesBuilder(dataConnect, utilisateurId: utilisateurId,);
  }
  
  
  AssignerRoleGlobalVariablesBuilder assignerRoleGlobal ({required int utilisateurId, required NomRole nomRole, }) {
    return AssignerRoleGlobalVariablesBuilder(dataConnect, utilisateurId: utilisateurId,nomRole: nomRole,);
  }
  
  
  AssignerRoleCommuneVariablesBuilder assignerRoleCommune ({required int utilisateurId, required NomRole nomRole, required int communeId, }) {
    return AssignerRoleCommuneVariablesBuilder(dataConnect, utilisateurId: utilisateurId,nomRole: nomRole,communeId: communeId,);
  }
  
  
  ValiderUtilisateurVariablesBuilder validerUtilisateur ({required String firebaseUid, }) {
    return ValiderUtilisateurVariablesBuilder(dataConnect, firebaseUid: firebaseUid,);
  }
  
  
  DesactiverUtilisateurVariablesBuilder desactiverUtilisateur ({required String firebaseUid, required String motifStatut, }) {
    return DesactiverUtilisateurVariablesBuilder(dataConnect, firebaseUid: firebaseUid,motifStatut: motifStatut,);
  }
  
  
  EnregistrerAuditVariablesBuilder enregistrerAudit ({required String typeEntite, required int entiteId, required String action, required String acteurFirebaseUid, }) {
    return EnregistrerAuditVariablesBuilder(dataConnect, typeEntite: typeEntite,entiteId: entiteId,action: action,acteurFirebaseUid: acteurFirebaseUid,);
  }
  
  
  CreerParcelleVariablesBuilder creerParcelle ({required String codeParcelle, required int utilisateurId, required int regionId, required int communeId, }) {
    return CreerParcelleVariablesBuilder(dataConnect, codeParcelle: codeParcelle,utilisateurId: utilisateurId,regionId: regionId,communeId: communeId,);
  }
  
  
  MettreAJourParcelleVariablesBuilder mettreAJourParcelle ({required int id, }) {
    return MettreAJourParcelleVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ValiderParcelleVariablesBuilder validerParcelle ({required int id, }) {
    return ValiderParcelleVariablesBuilder(dataConnect, id: id,);
  }
  
  
  RejeterParcelleVariablesBuilder rejeterParcelle ({required int id, required String motifRejet, }) {
    return RejeterParcelleVariablesBuilder(dataConnect, id: id,motifRejet: motifRejet,);
  }
  
  
  RejeterParcelleAvecMotifVariablesBuilder rejeterParcelleAvecMotif ({required int id, required String motifRejet, }) {
    return RejeterParcelleAvecMotifVariablesBuilder(dataConnect, id: id,motifRejet: motifRejet,);
  }
  
  
  ResoumettreParcelleVariablesBuilder resoumettreParcelle ({required int id, }) {
    return ResoumettreParcelleVariablesBuilder(dataConnect, id: id,);
  }
  
  
  TransfererParcelleEntreCommunesVariablesBuilder transfererParcelleEntreCommunes ({required int id, required int nouvelleRegionId, required int nouvelleCommuneId, }) {
    return TransfererParcelleEntreCommunesVariablesBuilder(dataConnect, id: id,nouvelleRegionId: nouvelleRegionId,nouvelleCommuneId: nouvelleCommuneId,);
  }
  
  
  SupprimerParcelleVariablesBuilder supprimerParcelle ({required int id, }) {
    return SupprimerParcelleVariablesBuilder(dataConnect, id: id,);
  }
  
  
  CreerTransactionVariablesBuilder creerTransaction ({required int parcelleId, required int vendeurId, required int acheteurId, required TypeTransaction typeTransaction, required DateTime dateTransaction, }) {
    return CreerTransactionVariablesBuilder(dataConnect, parcelleId: parcelleId,vendeurId: vendeurId,acheteurId: acheteurId,typeTransaction: typeTransaction,dateTransaction: dateTransaction,);
  }
  
  
  ValiderTransactionVariablesBuilder validerTransaction ({required int id, required int parcelleId, required int nouveauUtilisateurId, }) {
    return ValiderTransactionVariablesBuilder(dataConnect, id: id,parcelleId: parcelleId,nouveauUtilisateurId: nouveauUtilisateurId,);
  }
  
  
  RejeterTransactionAvecMotifVariablesBuilder rejeterTransactionAvecMotif ({required int id, required String motifRejet, }) {
    return RejeterTransactionAvecMotifVariablesBuilder(dataConnect, id: id,motifRejet: motifRejet,);
  }
  
  
  ResoumettreTransactionVariablesBuilder resoumettreTransaction ({required int id, }) {
    return ResoumettreTransactionVariablesBuilder(dataConnect, id: id,);
  }
  
  
  AjouterDocumentVariablesBuilder ajouterDocument ({required int parcelleId, required TypeDocument typeDocument, required String nomFichier, required String urlStockage, required String uploadeParFirebaseUid, }) {
    return AjouterDocumentVariablesBuilder(dataConnect, parcelleId: parcelleId,typeDocument: typeDocument,nomFichier: nomFichier,urlStockage: urlStockage,uploadeParFirebaseUid: uploadeParFirebaseUid,);
  }
  
  
  SupprimerDocumentVariablesBuilder supprimerDocument ({required int id, }) {
    return SupprimerDocumentVariablesBuilder(dataConnect, id: id,);
  }
  
  
  CreerTaxeFonciereVariablesBuilder creerTaxeFonciere ({required int parcelleId, required int anneeFiscale, required double montantDu, required DateTime dateEcheance, }) {
    return CreerTaxeFonciereVariablesBuilder(dataConnect, parcelleId: parcelleId,anneeFiscale: anneeFiscale,montantDu: montantDu,dateEcheance: dateEcheance,);
  }
  
  
  MarquerTaxePayeeVariablesBuilder marquerTaxePayee ({required int id, }) {
    return MarquerTaxePayeeVariablesBuilder(dataConnect, id: id,);
  }
  
  
  MarquerTaxeEnRetardVariablesBuilder marquerTaxeEnRetard ({required int id, }) {
    return MarquerTaxeEnRetardVariablesBuilder(dataConnect, id: id,);
  }
  
  
  MettreAJourTaxeFonciereVariablesBuilder mettreAJourTaxeFonciere ({required int id, }) {
    return MettreAJourTaxeFonciereVariablesBuilder(dataConnect, id: id,);
  }
  
  
  AnnulerTaxeVariablesBuilder annulerTaxe ({required int id, }) {
    return AnnulerTaxeVariablesBuilder(dataConnect, id: id,);
  }
  
  
  SupprimerTaxeFonciereVariablesBuilder supprimerTaxeFonciere ({required int id, }) {
    return SupprimerTaxeFonciereVariablesBuilder(dataConnect, id: id,);
  }
  
  
  AjouterSuiviVisuelVariablesBuilder ajouterSuiviVisuel ({required int parcelleId, required TypeMedia typeMedia, required String urlStockage, required String uploadeParFirebaseUid, }) {
    return AjouterSuiviVisuelVariablesBuilder(dataConnect, parcelleId: parcelleId,typeMedia: typeMedia,urlStockage: urlStockage,uploadeParFirebaseUid: uploadeParFirebaseUid,);
  }
  
  
  SupprimerSuiviVisuelVariablesBuilder supprimerSuiviVisuel ({required int id, }) {
    return SupprimerSuiviVisuelVariablesBuilder(dataConnect, id: id,);
  }
  
  
  CreerAbonnementVariablesBuilder creerAbonnement ({required int utilisateurId, required NiveauAbonnement niveau, required DateTime dateDebut, required DateTime dateFin, }) {
    return CreerAbonnementVariablesBuilder(dataConnect, utilisateurId: utilisateurId,niveau: niveau,dateDebut: dateDebut,dateFin: dateFin,);
  }
  
  
  RenouvelerAbonnementVariablesBuilder renouvelerAbonnement ({required int id, required DateTime dateFin, }) {
    return RenouvelerAbonnementVariablesBuilder(dataConnect, id: id,dateFin: dateFin,);
  }
  
  
  AnnulerAbonnementVariablesBuilder annulerAbonnement ({required int id, }) {
    return AnnulerAbonnementVariablesBuilder(dataConnect, id: id,);
  }
  
  
  MettreAJourAbonnementVariablesBuilder mettreAJourAbonnement ({required int id, }) {
    return MettreAJourAbonnementVariablesBuilder(dataConnect, id: id,);
  }
  
  
  SupprimerAbonnementVariablesBuilder supprimerAbonnement ({required int id, }) {
    return SupprimerAbonnementVariablesBuilder(dataConnect, id: id,);
  }
  
  
  EnregistrerPaiementVariablesBuilder enregistrerPaiement ({required int utilisateurId, required MethodePaiement methodePaiement, required double montant, }) {
    return EnregistrerPaiementVariablesBuilder(dataConnect, utilisateurId: utilisateurId,methodePaiement: methodePaiement,montant: montant,);
  }
  
  
  ConfirmerPaiementVariablesBuilder confirmerPaiement ({required int id, }) {
    return ConfirmerPaiementVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ConfirmerPaiementTaxeVariablesBuilder confirmerPaiementTaxe ({required int id, required int taxeFonciereId, }) {
    return ConfirmerPaiementTaxeVariablesBuilder(dataConnect, id: id,taxeFonciereId: taxeFonciereId,);
  }
  
  
  ConfirmerPaiementAbonnementVariablesBuilder confirmerPaiementAbonnement ({required int id, required int abonnementId, }) {
    return ConfirmerPaiementAbonnementVariablesBuilder(dataConnect, id: id,abonnementId: abonnementId,);
  }
  
  
  AnnulerPaiementVariablesBuilder annulerPaiement ({required int id, }) {
    return AnnulerPaiementVariablesBuilder(dataConnect, id: id,);
  }
  
  
  CreerAlerteVariablesBuilder creerAlerte ({required int utilisateurId, required TypeAlerte typeAlerte, required String message, }) {
    return CreerAlerteVariablesBuilder(dataConnect, utilisateurId: utilisateurId,typeAlerte: typeAlerte,message: message,);
  }
  
  
  MarquerAlerteLueVariablesBuilder marquerAlerteLue ({required int id, }) {
    return MarquerAlerteLueVariablesBuilder(dataConnect, id: id,);
  }
  
  
  SupprimerAlerteVariablesBuilder supprimerAlerte ({required int id, }) {
    return SupprimerAlerteVariablesBuilder(dataConnect, id: id,);
  }
  
  
  SignalerLitigeVariablesBuilder signalerLitige ({required int parcelleId, required int plaignantId, required String motif, }) {
    return SignalerLitigeVariablesBuilder(dataConnect, parcelleId: parcelleId,plaignantId: plaignantId,motif: motif,);
  }
  
  
  PasserLitigeEnExamenVariablesBuilder passerLitigeEnExamen ({required int id, }) {
    return PasserLitigeEnExamenVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ResoudreLitigeVariablesBuilder resoudreLitige ({required int id, required String resolution, }) {
    return ResoudreLitigeVariablesBuilder(dataConnect, id: id,resolution: resolution,);
  }
  
  
  RejeterLitigeVariablesBuilder rejeterLitige ({required int id, required String resolution, }) {
    return RejeterLitigeVariablesBuilder(dataConnect, id: id,resolution: resolution,);
  }
  
  
  SupprimerLitigeVariablesBuilder supprimerLitige ({required int id, }) {
    return SupprimerLitigeVariablesBuilder(dataConnect, id: id,);
  }
  
  
  CreerFraisEnregistrementVariablesBuilder creerFraisEnregistrement ({required int parcelleId, required TypeFrais typeFrais, required double montant, }) {
    return CreerFraisEnregistrementVariablesBuilder(dataConnect, parcelleId: parcelleId,typeFrais: typeFrais,montant: montant,);
  }
  
  
  MarquerFraisPayeVariablesBuilder marquerFraisPaye ({required int id, }) {
    return MarquerFraisPayeVariablesBuilder(dataConnect, id: id,);
  }
  
  
  AnnulerFraisVariablesBuilder annulerFrais ({required int id, required String motifRejet, }) {
    return AnnulerFraisVariablesBuilder(dataConnect, id: id,motifRejet: motifRejet,);
  }
  
  
  RejeterFraisVariablesBuilder rejeterFrais ({required int id, required String motifRejet, }) {
    return RejeterFraisVariablesBuilder(dataConnect, id: id,motifRejet: motifRejet,);
  }
  
  
  SupprimerFraisEnregistrementVariablesBuilder supprimerFraisEnregistrement ({required int id, }) {
    return SupprimerFraisEnregistrementVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListerRegionsVariablesBuilder listerRegions () {
    return ListerRegionsVariablesBuilder(dataConnect, );
  }
  
  
  ListerCommunesVariablesBuilder listerCommunes () {
    return ListerCommunesVariablesBuilder(dataConnect, );
  }
  
  
  ListerCommunesParRegionVariablesBuilder listerCommunesParRegion ({required int regionId, }) {
    return ListerCommunesParRegionVariablesBuilder(dataConnect, regionId: regionId,);
  }
  
  
  ListerSousPrefecturesVariablesBuilder listerSousPrefectures () {
    return ListerSousPrefecturesVariablesBuilder(dataConnect, );
  }
  
  
  ListerSousPrefecturesParCommuneVariablesBuilder listerSousPrefecturesParCommune ({required int communeId, }) {
    return ListerSousPrefecturesParCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ObtenirProfilParFirebaseUidVariablesBuilder obtenirProfilParFirebaseUid ({required String firebaseUid, }) {
    return ObtenirProfilParFirebaseUidVariablesBuilder(dataConnect, firebaseUid: firebaseUid,);
  }
  
  
  EstProfilIncompletVariablesBuilder estProfilIncomplet ({required String firebaseUid, }) {
    return EstProfilIncompletVariablesBuilder(dataConnect, firebaseUid: firebaseUid,);
  }
  
  
  ListerUtilisateursParStatutCompteVariablesBuilder listerUtilisateursParStatutCompte ({required StatutCompte statutCompte, }) {
    return ListerUtilisateursParStatutCompteVariablesBuilder(dataConnect, statutCompte: statutCompte,);
  }
  
  
  ObtenirUtilisateurParIdVariablesBuilder obtenirUtilisateurParId ({required int id, }) {
    return ObtenirUtilisateurParIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListerTousUtilisateursVariablesBuilder listerTousUtilisateurs () {
    return ListerTousUtilisateursVariablesBuilder(dataConnect, );
  }
  
  
  ObtenirRoleParUtilisateurIdVariablesBuilder obtenirRoleParUtilisateurId ({required int utilisateurId, }) {
    return ObtenirRoleParUtilisateurIdVariablesBuilder(dataConnect, utilisateurId: utilisateurId,);
  }
  
  
  VerifierAppartenanceCommuneVariablesBuilder verifierAppartenanceCommune ({required int utilisateurId, required int communeId, }) {
    return VerifierAppartenanceCommuneVariablesBuilder(dataConnect, utilisateurId: utilisateurId,communeId: communeId,);
  }
  
  
  ListerAuditToutesVariablesBuilder listerAuditToutes () {
    return ListerAuditToutesVariablesBuilder(dataConnect, );
  }
  
  
  ListerAuditParActeurVariablesBuilder listerAuditParActeur ({required String acteurFirebaseUid, }) {
    return ListerAuditParActeurVariablesBuilder(dataConnect, acteurFirebaseUid: acteurFirebaseUid,);
  }
  
  
  ListerAuditParCommuneVariablesBuilder listerAuditParCommune ({required int communeId, }) {
    return ListerAuditParCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ListerAuditParTypeEntiteVariablesBuilder listerAuditParTypeEntite ({required String typeEntite, }) {
    return ListerAuditParTypeEntiteVariablesBuilder(dataConnect, typeEntite: typeEntite,);
  }
  
  
  ListerHistoriqueRejetsEtSuppressionsVariablesBuilder listerHistoriqueRejetsEtSuppressions () {
    return ListerHistoriqueRejetsEtSuppressionsVariablesBuilder(dataConnect, );
  }
  
  
  ObtenirParcelleParIdVariablesBuilder obtenirParcelleParId ({required int id, }) {
    return ObtenirParcelleParIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ObtenirParcelleParQrCodeVariablesBuilder obtenirParcelleParQrCode ({required String qrCode, }) {
    return ObtenirParcelleParQrCodeVariablesBuilder(dataConnect, qrCode: qrCode,);
  }
  
  
  ListerParcellesParUtilisateurVariablesBuilder listerParcellesParUtilisateur ({required int utilisateurId, }) {
    return ListerParcellesParUtilisateurVariablesBuilder(dataConnect, utilisateurId: utilisateurId,);
  }
  
  
  ListerParcellesParCommuneVariablesBuilder listerParcellesParCommune ({required int communeId, }) {
    return ListerParcellesParCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ListerParcellesParStatutVariablesBuilder listerParcellesParStatut ({required int communeId, required StatutParcelle statut, }) {
    return ListerParcellesParStatutVariablesBuilder(dataConnect, communeId: communeId,statut: statut,);
  }
  
  
  ListerParcellesRejeteesParCommuneVariablesBuilder listerParcellesRejeteesParCommune ({required int communeId, }) {
    return ListerParcellesRejeteesParCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ListerParcellesDansZoneVariablesBuilder listerParcellesDansZone ({required double latMin, required double latMax, required double lonMin, required double lonMax, }) {
    return ListerParcellesDansZoneVariablesBuilder(dataConnect, latMin: latMin,latMax: latMax,lonMin: lonMin,lonMax: lonMax,);
  }
  
  
  RechercherParcellesVariablesBuilder rechercherParcelles ({required String terme, }) {
    return RechercherParcellesVariablesBuilder(dataConnect, terme: terme,);
  }
  
  
  ListerToutesParcellesVariablesBuilder listerToutesParcelles () {
    return ListerToutesParcellesVariablesBuilder(dataConnect, );
  }
  
  
  ObtenirTransactionParIdVariablesBuilder obtenirTransactionParId ({required int id, }) {
    return ObtenirTransactionParIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListerTransactionsParParcelleVariablesBuilder listerTransactionsParParcelle ({required int parcelleId, }) {
    return ListerTransactionsParParcelleVariablesBuilder(dataConnect, parcelleId: parcelleId,);
  }
  
  
  ListerTransactionsParUtilisateurVariablesBuilder listerTransactionsParUtilisateur ({required int utilisateurId, }) {
    return ListerTransactionsParUtilisateurVariablesBuilder(dataConnect, utilisateurId: utilisateurId,);
  }
  
  
  ListerTransactionsEnAttenteParCommuneVariablesBuilder listerTransactionsEnAttenteParCommune ({required int communeId, }) {
    return ListerTransactionsEnAttenteParCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ListerTransactionsRejeteesParCommuneVariablesBuilder listerTransactionsRejeteesParCommune ({required int communeId, }) {
    return ListerTransactionsRejeteesParCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ObtenirHistoriqueProprieteVariablesBuilder obtenirHistoriquePropriete ({required int parcelleId, }) {
    return ObtenirHistoriqueProprieteVariablesBuilder(dataConnect, parcelleId: parcelleId,);
  }
  
  
  ListerToutesTransactionsVariablesBuilder listerToutesTransactions () {
    return ListerToutesTransactionsVariablesBuilder(dataConnect, );
  }
  
  
  ObtenirDocumentParIdVariablesBuilder obtenirDocumentParId ({required int id, }) {
    return ObtenirDocumentParIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListerDocumentsParParcelleVariablesBuilder listerDocumentsParParcelle ({required int parcelleId, }) {
    return ListerDocumentsParParcelleVariablesBuilder(dataConnect, parcelleId: parcelleId,);
  }
  
  
  ListerTousDocumentsVariablesBuilder listerTousDocuments () {
    return ListerTousDocumentsVariablesBuilder(dataConnect, );
  }
  
  
  ObtenirTaxeParIdVariablesBuilder obtenirTaxeParId ({required int id, }) {
    return ObtenirTaxeParIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListerTaxesParParcelleVariablesBuilder listerTaxesParParcelle ({required int parcelleId, }) {
    return ListerTaxesParParcelleVariablesBuilder(dataConnect, parcelleId: parcelleId,);
  }
  
  
  ListerTaxesEnRetardParCommuneVariablesBuilder listerTaxesEnRetardParCommune ({required int communeId, }) {
    return ListerTaxesEnRetardParCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ListerTaxesEcheanceDepasseeVariablesBuilder listerTaxesEcheanceDepassee ({required int communeId, required DateTime dateActuelle, }) {
    return ListerTaxesEcheanceDepasseeVariablesBuilder(dataConnect, communeId: communeId,dateActuelle: dateActuelle,);
  }
  
  
  ObtenirRapportFinancierCommuneVariablesBuilder obtenirRapportFinancierCommune ({required int communeId, }) {
    return ObtenirRapportFinancierCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ListerToutesTaxesVariablesBuilder listerToutesTaxes () {
    return ListerToutesTaxesVariablesBuilder(dataConnect, );
  }
  
  
  ListerSuiviVisuelParParcelleVariablesBuilder listerSuiviVisuelParParcelle ({required int parcelleId, }) {
    return ListerSuiviVisuelParParcelleVariablesBuilder(dataConnect, parcelleId: parcelleId,);
  }
  
  
  ListerSuiviVisuelRecentParParcelleVariablesBuilder listerSuiviVisuelRecentParParcelle ({required int parcelleId, }) {
    return ListerSuiviVisuelRecentParParcelleVariablesBuilder(dataConnect, parcelleId: parcelleId,);
  }
  
  
  ListerSuiviVisuelCompletParParcelleVariablesBuilder listerSuiviVisuelCompletParParcelle ({required int parcelleId, }) {
    return ListerSuiviVisuelCompletParParcelleVariablesBuilder(dataConnect, parcelleId: parcelleId,);
  }
  
  
  ObtenirContexteAccesSuiviVisuelVariablesBuilder obtenirContexteAccesSuiviVisuel ({required int parcelleId, required int utilisateurId, }) {
    return ObtenirContexteAccesSuiviVisuelVariablesBuilder(dataConnect, parcelleId: parcelleId,utilisateurId: utilisateurId,);
  }
  
  
  ObtenirUploadsRecentsPourAbonnementVariablesBuilder obtenirUploadsRecentsPourAbonnement ({required int parcelleId, required int utilisateurId, required Timestamp depuis, }) {
    return ObtenirUploadsRecentsPourAbonnementVariablesBuilder(dataConnect, parcelleId: parcelleId,utilisateurId: utilisateurId,depuis: depuis,);
  }
  
  
  ObtenirAbonnementActifParUtilisateurVariablesBuilder obtenirAbonnementActifParUtilisateur ({required int utilisateurId, }) {
    return ObtenirAbonnementActifParUtilisateurVariablesBuilder(dataConnect, utilisateurId: utilisateurId,);
  }
  
  
  ListerAbonnementsParUtilisateurVariablesBuilder listerAbonnementsParUtilisateur ({required int utilisateurId, }) {
    return ListerAbonnementsParUtilisateurVariablesBuilder(dataConnect, utilisateurId: utilisateurId,);
  }
  
  
  ListerAbonnementsActifsToutesVariablesBuilder listerAbonnementsActifsToutes () {
    return ListerAbonnementsActifsToutesVariablesBuilder(dataConnect, );
  }
  
  
  ListerTousAbonnementsVariablesBuilder listerTousAbonnements () {
    return ListerTousAbonnementsVariablesBuilder(dataConnect, );
  }
  
  
  ObtenirPaiementParIdVariablesBuilder obtenirPaiementParId ({required int id, }) {
    return ObtenirPaiementParIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListerPaiementsParUtilisateurVariablesBuilder listerPaiementsParUtilisateur ({required int utilisateurId, }) {
    return ListerPaiementsParUtilisateurVariablesBuilder(dataConnect, utilisateurId: utilisateurId,);
  }
  
  
  ListerPaiementsTaxeEnAttenteParCommuneVariablesBuilder listerPaiementsTaxeEnAttenteParCommune ({required int communeId, }) {
    return ListerPaiementsTaxeEnAttenteParCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ListerPaiementsAbonnementEnAttenteVariablesBuilder listerPaiementsAbonnementEnAttente () {
    return ListerPaiementsAbonnementEnAttenteVariablesBuilder(dataConnect, );
  }
  
  
  ListerTousPaiementsVariablesBuilder listerTousPaiements () {
    return ListerTousPaiementsVariablesBuilder(dataConnect, );
  }
  
  
  ObtenirAlerteParIdVariablesBuilder obtenirAlerteParId ({required int id, }) {
    return ObtenirAlerteParIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListerAlertesParUtilisateurVariablesBuilder listerAlertesParUtilisateur ({required int utilisateurId, }) {
    return ListerAlertesParUtilisateurVariablesBuilder(dataConnect, utilisateurId: utilisateurId,);
  }
  
  
  ListerAlertesNonLuesParUtilisateurVariablesBuilder listerAlertesNonLuesParUtilisateur ({required int utilisateurId, }) {
    return ListerAlertesNonLuesParUtilisateurVariablesBuilder(dataConnect, utilisateurId: utilisateurId,);
  }
  
  
  ListerToutesAlertesVariablesBuilder listerToutesAlertes () {
    return ListerToutesAlertesVariablesBuilder(dataConnect, );
  }
  
  
  ObtenirLitigeParIdVariablesBuilder obtenirLitigeParId ({required int id, }) {
    return ObtenirLitigeParIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListerLitigesParParcelleVariablesBuilder listerLitigesParParcelle ({required int parcelleId, }) {
    return ListerLitigesParParcelleVariablesBuilder(dataConnect, parcelleId: parcelleId,);
  }
  
  
  ListerLitigesOuvertsParCommuneVariablesBuilder listerLitigesOuvertsParCommune ({required int communeId, }) {
    return ListerLitigesOuvertsParCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ListerTousLitigesVariablesBuilder listerTousLitiges () {
    return ListerTousLitigesVariablesBuilder(dataConnect, );
  }
  
  
  ObtenirFraisParIdVariablesBuilder obtenirFraisParId ({required int id, }) {
    return ObtenirFraisParIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListerFraisParParcelleVariablesBuilder listerFraisParParcelle ({required int parcelleId, }) {
    return ListerFraisParParcelleVariablesBuilder(dataConnect, parcelleId: parcelleId,);
  }
  
  
  ListerFraisEnAttenteParCommuneVariablesBuilder listerFraisEnAttenteParCommune ({required int communeId, }) {
    return ListerFraisEnAttenteParCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ListerTousFraisVariablesBuilder listerTousFrais () {
    return ListerTousFraisVariablesBuilder(dataConnect, );
  }
  
  
  ObtenirStatistiquesCommuneVariablesBuilder obtenirStatistiquesCommune ({required int communeId, }) {
    return ObtenirStatistiquesCommuneVariablesBuilder(dataConnect, communeId: communeId,);
  }
  
  
  ObtenirChronologieParcelleVariablesBuilder obtenirChronologieParcelle ({required int parcelleId, }) {
    return ObtenirChronologieParcelleVariablesBuilder(dataConnect, parcelleId: parcelleId,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'porhe-foncier-23072026',
    'porhe-foncier-23072026-sid',
  );

  PorheFoncier23072026Connector({required this.dataConnect});
  static PorheFoncier23072026Connector get instance {
    
    return PorheFoncier23072026Connector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
