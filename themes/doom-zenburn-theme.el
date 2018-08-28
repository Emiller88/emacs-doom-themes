;;; doom-zenburn-theme.el --- inspired by Atom One Dark
(require 'doom-themes)

;;
(defgroup doom-zenburn-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-zenburn-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-zenburn-theme
  :type 'boolean)

(defcustom doom-zenburn-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-zenburn-theme
  :type 'boolean)

(defcustom doom-zenburn-comment-bg doom-zenburn-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-zenburn-theme
  :type 'boolean)

(defcustom doom-zenburn-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-zenburn-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-zenburn
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  ((bg         '("#4f4f4e" nil       nil            ))
   (bg-alt     '("#3f3f3f" nil       nil            ))
   (base0      '("#5f5f5c" "black"   "black"        ))
   (base1      '("#6f6f6b" "#1e1e1e" "brightblack"  ))
   (base2      '("#7f7f7a" "#2e2e2e" "brightblack"  ))
   (base3      '("#8f8f88" "#262626" "brightblack"  ))
   (base4      '("#9f9f97" "#3f3f3f" "brightblack"  ))
   (base5      '("#afafa6" "#525252" "brightblack"  ))
   (base6      '("#bfbfb4" "#6b6b6b" "brightblack"  ))
   (base7      '("#cfcfc3" "#979797" "brightblack"  ))
   (base8      '("#dfdfd2" "#dfdfdf" "white"        ))
   (fg         '("#efefe0" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#ffffef" "#2d2d2d" "white"        ))

   (grey       base4)
   (red        '("#CC9393" "#ff6655" "red"          ))
   (orange     '("#DFAF8F" "#dd8844" "brightred"    ))
   (green      '("#7F9F7F" "#99bb66" "green"        ))
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  ))
   (yellow     '("#F0DFAF" "#ECBE7B" "yellow"       ))
   (blue       '("#8CD0D3" "#51afef" "brightblue"   ))
   (dark-blue  '("#2257A0" "#2257A0" "blue"         ))
   (magenta    '("#DC8CC3" "#c678dd" "magenta"      ))
   (violet     '("#a9a1e1" "#a9a1e1" "brightmagenta"))
   (cyan       '("#93E0E3" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if doom-zenburn-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-zenburn-brighter-comments dark-cyan base5) 0.25))
   (constants      violet)
   (functions      magenta)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        green)
   (variables      (doom-lighten magenta 0.4))
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base0) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-zenburn-brighter-modeline)
   (-modeline-pad
    (when doom-zenburn-padded-modeline
      (if (integerp doom-zenburn-padded-modeline) doom-zenburn-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg-alt 0.1))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (evil-goggles-default-face :inherit 'region :background (doom-blend region bg 0.5))

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-zenburn-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; ivy-mode
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-zenburn-theme.el ends here
