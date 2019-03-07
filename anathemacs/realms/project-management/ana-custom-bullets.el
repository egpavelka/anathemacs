;;; ana-custom-bullets.el ---

;; Author: e.g. pavelka <pav@egpavelka.com>
;; URL: https://github.com/egpavelka/anathemacs

;;; Commentary:
;; Add special icons to mirror the notation system in my physical bullet journal.
;;

;;; Code:
(setq org-todo-keywords '((sequence "□" "◪" "▶" "|" "■" "☒")
                          ;; todo, partially done, postponed | completed, cancelled
                          ;; (sequence "⛥" "▲" "❗" "✓" "▪" "❓" "⛅" "🗲" "♥""＄" "|")
                          ;; event, appointment, important, accomplishment, note, research, fantasy, idea, inspiration, finance
                          ))

; special icons
(defface keyword-icons-face
  '((t (:inherit none :background nil :foreground "#d07c67" :family "ETBembo" :height 1.5)))
  "face for bullet journal style icons"
  )

(defvar org-mode-keywords
  '(("⛥" . 'keyword-icons-face)
    ("▲" . 'keyword-icons-face)
    ("❗" . 'keyword-icons-face)
    ("✓" . 'keyword-icons-face)
    ("▪" . 'keyword-icons-face)
    ("❓" . 'keyword-icons-face)
    ("⛅" . 'keyword-icons-face)
    ("🗲" . 'keyword-icons-face)
    ("♥" . 'keyword-icons-face)
    ("＄" . 'keyword-icons-face)
    ))
(font-lock-add-keywords 'org-mode org-mode-keywords)

(provide 'ana-custom-bullets)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-custom-bullets.el ends here
