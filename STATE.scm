;;; STATE.scm - Project State Checkpoint
;;; nick-shells - Session State File
;;; Format: Guile Scheme

(define-module (state nick-shells)
  #:export (metadata user-context session-context focus
            project-catalog history critical-next-actions
            questions-for-user))

;;;; ============================================================
;;;; METADATA
;;;; ============================================================

(define metadata
  '((format-version . "1.0.0")
    (created . "2025-12-08")
    (last-updated . "2025-12-08")
    (project-name . "nick-shells")
    (repository . "hyperpolymath/nick-shells")
    (license . "MIT")))

;;;; ============================================================
;;;; USER CONTEXT
;;;; ============================================================

(define user-context
  '((name . "Jonathan D.A. Jewell")
    (handle . "hyperpolymath")
    (roles . ("developer" "project-owner"))
    (preferences . ((ai-assistant . "Claude")
                    (version-control . "git")
                    (state-format . "Guile Scheme")))))

;;;; ============================================================
;;;; SESSION CONTEXT
;;;; ============================================================

(define session-context
  '((session-id . "01Q1KJDHmAJqV191g7uDwPkE")
    (branch . "claude/create-state-scm-01Q1KJDHmAJqV191g7uDwPkE")
    (session-type . "initial-state-creation")))

;;;; ============================================================
;;;; CURRENT POSITION
;;;; ============================================================

(define current-position
  '((status . "greenfield")
    (completion-percentage . 0)
    (phase . "inception")
    (description . "Repository initialized with boilerplate files only")

    (existing-assets
     . ((documentation . ("README.md (empty title only)"
                          "SECURITY.md (template)"
                          "CODE_OF_CONDUCT.md (standard)"
                          "LICENSE (MIT)"))
        (infrastructure . ("dependabot.yml"
                           "codeql.yml"
                           "jekyll-gh-pages.yml"))
        (issue-templates . ("bug_report.md"
                            "feature_request.md"
                            "custom.md"))
        (source-code . #f)))

    (observations
     . ("No source code exists yet"
        "Project purpose undefined in README"
        "Name 'nick-shells' suggests shell-related tooling"
        "Security policy uses placeholder version numbers"))))

;;;; ============================================================
;;;; ROUTE TO MVP v1
;;;; ============================================================

(define mvp-v1-route
  '((status . "undefined - requires user input")

    (assumed-interpretation
     . "Based on name 'nick-shells', possible directions include:
        1. Collection of shell scripts/utilities
        2. Shell configuration dotfiles
        3. Custom shell implementation
        4. Shell-based developer tooling")

    (generic-mvp-phases
     . ((phase-1 . ((name . "Define Scope")
                    (tasks . ("Clarify project purpose"
                              "Define target users"
                              "Establish core features for v1"
                              "Update README with project description"))
                    (status . "pending")))

        (phase-2 . ((name . "Architecture")
                    (tasks . ("Design directory structure"
                              "Choose implementation language(s)"
                              "Define interfaces/APIs"
                              "Document architecture decisions"))
                    (status . "blocked")
                    (blocker . "Requires phase-1 completion")))

        (phase-3 . ((name . "Core Implementation")
                    (tasks . ("Implement core functionality"
                              "Write unit tests"
                              "Create usage examples"))
                    (status . "blocked")
                    (blocker . "Requires phase-2 completion")))

        (phase-4 . ((name . "Documentation & Polish")
                    (tasks . ("Complete README"
                              "Write installation guide"
                              "Create CONTRIBUTING.md"
                              "Update SECURITY.md with real versions"))
                    (status . "blocked")
                    (blocker . "Requires phase-3 completion")))

        (phase-5 . ((name . "Release")
                    (tasks . ("Tag v1.0.0"
                              "Create GitHub release"
                              "Announce if applicable"))
                    (status . "blocked")
                    (blocker . "Requires phase-4 completion")))))))

;;;; ============================================================
;;;; ISSUES / BLOCKERS
;;;; ============================================================

(define issues
  '((critical
     . ((issue-1 . ((title . "Project purpose undefined")
                    (description . "README.md contains only the title 'nick-shells' with no description of what this project does or aims to accomplish")
                    (impact . "Cannot proceed with any implementation without understanding goals")
                    (resolution . "User input required")))))

    (moderate
     . ((issue-2 . ((title . "SECURITY.md uses placeholder versions")
                    (description . "Security policy references versions 5.1.x, 5.0.x, 4.0.x which don't exist")
                    (impact . "Misleading for potential contributors")
                    (resolution . "Update once actual versioning is established")))

        (issue-3 . ((title . "No .gitignore")
                    (description . "Repository lacks a .gitignore file")
                    (impact . "Risk of committing unwanted files")
                    (resolution . "Create .gitignore based on chosen tech stack")))))

    (minor
     . ((issue-4 . ((title . "CODE_OF_CONDUCT.md missing contact")
                    (description . "Enforcement section has empty contact field")
                    (impact . "No way to report violations")
                    (resolution . "Add contact email/method")))))))

;;;; ============================================================
;;;; QUESTIONS FOR USER
;;;; ============================================================

(define questions-for-user
  '((q1 . ((question . "What is the purpose of nick-shells?")
           (context . "The name suggests shell-related tooling but no description exists")
           (options . ("Collection of shell scripts/utilities"
                       "Personal dotfiles/shell configuration"
                       "Custom shell or shell extension"
                       "CLI tool framework"
                       "Something else entirely"))))

    (q2 . ((question . "What is the target audience?")
           (context . "Needed to determine documentation style and feature scope")
           (options . ("Personal use only"
                       "Team/organization internal"
                       "Open source community"
                       "Enterprise/commercial"))))

    (q3 . ((question . "What languages/technologies should be used?")
           (context . "Determines toolchain, testing approach, and CI configuration")
           (options . ("Bash/POSIX shell"
                       "Zsh"
                       "Fish"
                       "Python"
                       "Rust"
                       "Go"
                       "Multiple/hybrid"))))

    (q4 . ((question . "What are the must-have features for MVP v1?")
           (context . "Defines the minimum scope for first release")
           (examples . ("List 3-5 core capabilities"))))

    (q5 . ((question . "Any existing code, scripts, or designs to incorporate?")
           (context . "Accelerates development if prior work exists")
           (follow-up . "If yes, where can they be found?")))

    (q6 . ((question . "What is the intended release timeline?")
           (context . "Helps prioritize features and scope")
           (note . "No pressure - just for planning")))))

;;;; ============================================================
;;;; LONG-TERM ROADMAP
;;;; ============================================================

(define long-term-roadmap
  '((status . "speculative - requires user input")

    (note . "This roadmap is a placeholder framework. Actual milestones depend on project definition.")

    (phases
     . ((v1-mvp . ((description . "Minimum Viable Product")
                   (focus . "Core functionality that solves the primary use case")
                   (status . "planning")))

        (v1-x . ((description . "Iterative improvements")
                 (focus . "Bug fixes, performance, user feedback incorporation")
                 (status . "future")))

        (v2 . ((description . "Major feature expansion")
               (focus . "Extended capabilities based on v1 learnings")
               (status . "future")))

        (ongoing . ((description . "Maintenance and evolution")
                    (focus . "Security updates, compatibility, community growth")
                    (status . "future")))))

    (potential-directions
     . ("Cross-platform support"
        "Plugin/extension system"
        "Integration with popular tools"
        "Performance optimizations"
        "Enterprise features if applicable"
        "Community contribution framework"))))

;;;; ============================================================
;;;; FOCUS (Current Session Priority)
;;;; ============================================================

(define focus
  '((current-priority . "Project definition and scope clarification")
    (phase . "inception")
    (blocking-dependencies . ("User input on project purpose"
                              "User input on MVP features"))
    (session-goal . "Establish STATE.scm and gather requirements")))

;;;; ============================================================
;;;; PROJECT CATALOG
;;;; ============================================================

(define project-catalog
  '((nick-shells
     . ((status . "in-progress")
        (completion . 5)
        (category . "shell-tooling")
        (phase . "inception")
        (dependencies . ())
        (blockers . ("project-scope-undefined"))
        (next-actions . ("Answer questions in questions-for-user section"
                         "Define MVP feature set"
                         "Update README.md"))))))

;;;; ============================================================
;;;; HISTORY
;;;; ============================================================

(define history
  '((2025-12-08
     . ((event . "STATE.scm created")
        (completion . 5)
        (notes . "Initial state file. Repository contains only boilerplate.")))))

;;;; ============================================================
;;;; CRITICAL NEXT ACTIONS
;;;; ============================================================

(define critical-next-actions
  '((action-1 . ((task . "User to answer questions in questions-for-user")
                 (priority . "critical")
                 (rationale . "Cannot proceed without project definition")))

    (action-2 . ((task . "Update README.md with project description")
                 (priority . "high")
                 (rationale . "First thing visitors see")))

    (action-3 . ((task . "Create .gitignore appropriate for tech stack")
                 (priority . "medium")
                 (rationale . "Prevent unwanted file commits")))

    (action-4 . ((task . "Fix SECURITY.md placeholder versions")
                 (priority . "low")
                 (rationale . "Cleanup once versioning established")))))

;;; End of STATE.scm
