;;; ana-filing.el ---

;; Author: e.g. pavelka <pav@egpavelka.com>
;; URL: https://github.com/egpavelka/anathemacs

;;; Commentary:
;;
;;

;;; Code:
(use-package org-brain
  :general
  (hs-leader-def
    "BA"  'org-brain-agenda
    "B.c" 'org-brain-add-child
    "B.C" 'org-brain-add-child-headline
    "B.f" 'org-brain-add-friendship
    "B.p" 'org-brain-add-parent
    "B,c" 'org-brain-remove-child
    "B,f" 'org-brain-remove-friendship
    "B,p" 'org-brain-remove-parent
    "Bg"  'org-brain-goto
    "B/c" 'org-brain-goto-child
    "B/f" 'org-brain-goto-friendship
    "B/p" 'org-brain-goto-parent
    "B/e" 'org-brain-goto-end
    "B/o" 'org-brain-goto-current
    "B/w" 'org-brain-goto-other-window
    "Bp"  'org-brain-pin
    "Br"  'org-brain-refile)
  :config
  (setq org-brain-path 'user-org-brain-dir
        org-id-track-globally t
        org-id-locations-file (concat user-dir ".org-id-locations")
        org-brain-visualize-default-choices 'all
        org-brain-title-max-length 12))

(use-package org-chef
  :defer t)

(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
  (org-journal-new-entry t)
  ;; Position point on the journal's top-level heading so that org-capture
  ;; will add the new entry as a child entry.
  (goto-char (point-min)))

(setq org-capture-templates
      '((
      ;;---BASIC CAPTURES
      ;;;; TODO
         "t" "tarea" entry
         (file+headline user-master-file "braindump")
         "** □ %^{tarea} %?
SCHEDULED: %t
:PROPERTIES:
:CREATED: %T
:realm:
:project:
:END:")
        
      ;;;; APPOINTMENT
        ("c" "cita" entry
         (file+olp+datetree user-cal-file)
         "** ▲ %^{cita} %? :appointment:
SCHEDULED: %T
:PROPERTIES:
:location:
:END:"
         :tree-type month)

      ;;;; EVENT
        ("e" "evento" entry
         (file+olp+datetree user-cal-file)
         "** ⛥ %^{evento} %? :event:
SCHEDULED: %t"
         :tree-type month)

      ;;;; NOTE
        ("n" "nota" entry
         (file+headline user-master-file "braindump")
         "** %^{nota} %? :note:
:PROPERTIES:
:CREATED: %T
:realm:
:END:")
        
      ;;;; LINK
        ("l" "enlace" entry
         ((file+headline user-master-file "braindump"))
         "** %(org-cliplink-capture) :website:
:PROPERTIES:
:CREATED: %T
:realm: %?
:END:")
        
      ;;;; BOOKMARK
        ("m" "marcador" entry
         (file+headline user-master-file "marcadores")
         "** %?
%a
:PROPERTIES:
:CREATED: %T
:realm:
:project:
:END:")
        ;;;; JOURNAL
        ("d" "diario" entry (function org-journal-find-location)
"* %(format-time-string org-journal-time-format)
%i%?
CLOSED: %t
:PROPERTIES:
:realm: escritura
:word_count:
:END:")
        
      ;;---THIRD-PARTY PACKAGE CAPTURES
      ;;;; ORG-JOURNAL
        ;; ("j" "DIARY" entry
        ;;  (function org-journal-find-location)
        ;;  "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")

      ;;;; ORG-BRAIN
        ("C" "cerebro" plain
         (function org-brain-goto-end)
         "* %i%?")
        
      ;;;; ORG-CHEF
        ("r" "receta" entry
         (file user-cookbook-file)
         "%(org-chef-get-recipe-from-url)")
        ("R" "receta [manual]" entry
         (file user-cookbook-file)
         "* %^{Recipe title: }
:PROPERTIES:
:source-url:
:servings:
:prep-time:
:cook-time:
:ready-in:
:END:
** Ingredients
%?
** Directions")

      ;;---PERSONAL
      ;;;; 
;;         ("i" "IDEA" entry ;; 🗲
;;          (file+headline user-master-file "braindump")
;;          "** %(all-the-icons-faicon \"lightbulb-o\" :face 'all-the-icons-lpink) %^{idea} %?
;; :PROPERTIES:
;; :CREATED: %T
;; :END:")
        
;;         ("I" "IMPORTANT" entry
;;          (file+headline user-master-file "braindump")
;;          ;; %(all-the-icons-faicon \"exclamation\" :face 'all-the-icons-lpink)
;;          "** ❗ %^{big deal} %? :important:
;; :PROPERTIES:
;; :CREATED: %T
;; :END:")

;;         ("F" "FANTASY" entry
;;          (file+headline user-master-file "braindump")
;;          ;; %(all-the-icons-material \"cloud_queue\" :face 'all-the-icons-lpink)
;;          "** ⛅ %^{pipe dream} %?
;; :PROPERTIES:
;; :CREATED: %T
;; :END:")

;;         ("f" "FINANCE" entry
;; orgmode/comments/aeaq9d/anyone_using_org_mode_as_snippet_manager/         (file+headline user-master-file "braindump")
;;          ;; %(all-the-icons-material \"attach_money\" :face 'all-the-icons-lpink)
;;          "** ＄ %^{dinero} %? :finance:
;; :PROPERTIES:
;; :CREATED: %T
;; :END:")

;;         ("P" "INSPIRATION" entry
;;          (file+headline user-master-file "braindump")
;;          ;; %(all-the-icons-material \"favorite\" :face 'all-the-icons-lpink)
;;          "** ♥ %^{inspo} %? :inspiration:
;; :PROPERTIES:
;; :CREATED: %T
;; :END:")

;;         ("A" "ACCOMPLISHMENT" entry
;;          (file+olp+datetree user-cal-file)
;;          ;; %(all-the-icons-faicon \"check\" :face 'all-the-icons-lpink)
;;          "** ✓ %^{milestone} %? :accomplishment:
;; :PROPERTIES:
;; :CREATED: %T
;; :END:"
;;          :time-prompt t
;;          :tree-type week)

;;         ("S" "RESEARCH" entry
;;          (file+headline user-master-file "braindump")
;;          ;; %(all-the-icons-faicon \"question\" :face 'all-the-icons-lpink)
;;          "** ❓ %^{look up} %? :research:
;; :PROPERTIES:
;; :CREATED: %T
;; :END:")
        ))

(hs-leader-def
  "c" 'org-capture)

;; properties
;; (setq org-tempo-keywords-alist '())

(provide 'ana-filing)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-filing.el ends here
