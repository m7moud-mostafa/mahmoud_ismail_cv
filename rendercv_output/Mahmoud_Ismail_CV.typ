
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Mahmoud Ismail"
#let locale-catalog-page-numbering-style = context { "Mahmoud Ismail - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Aug 2025"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "New Computer Modern"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.2cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "New Computer Modern"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "New Computer Modern"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "New Computer Modern"
#let design-header-vertical-space-between-name-and-connections = 0.4cm
#let design-header-vertical-space-between-connections-and-first-section = 0.4cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "◦"
#let design-highlights-top-margin = 0.2cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.15cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = false
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 1cm
#let design-page-bottom-margin = 1cm
#let design-page-left-margin = 1.1cm
#let design-page-right-margin = 1.1cm
#let design-page-show-last-updated-date = false
#let design-page-show-page-numbering = false
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Mahmoud Ismail

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Cairo, Egypt],
  [#box(original-link("mailto:mahmoud.ismail.dev@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)mahmoud.ismail.dev\@gmail.com])],
  [#box(original-link("tel:+20-15-54759293")[#fa-icon("phone", size: 0.9em) #h(0.05cm)015 54759293])],
  [#box(original-link("https://linkedin.com/in/ma7moud-mostafa")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)ma7moud-mostafa])],
  [#box(original-link("https://github.com/m7moud-mostafa")[#fa-icon("github", size: 0.9em) #h(0.05cm)m7moud-mostafa])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Fresh engineering graduate with hands-on experience in robotics and autonomous systems. Achieved 3rd place globally in Shell Eco-marathon autonomous competition, integrating mechanical with software to deliver real-world solutions.]
)


== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Cairo University]

#emph[Bachelor of Mechanical Design and Production Engineering]
  ],
  right-content: [
    #emph[Giza, Egypt]

#emph[2020 – 2025]
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Indomie Egypt]

#emph[Production Planning & Warehouse Intern]
  ],
  right-content: [
    #emph[Badr City, Cairo]

#emph[Jul 2025 – Aug 2025]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Built #strong[linear programming model] for #strong[RM & FG flows], saving \~30 min\/day],[Automated warehouse Excel reports, saving \~2 hrs\/day, improving #strong[supply chain] visibility],[Used #strong[Microsoft Dynamics ERP] for #strong[dispatch, RM tracking], and stock updates],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Shell Eco Racing Team \(CUERT\)]

#emph[Director of Autonomous Teams]
  ],
  right-content: [
    #emph[Cairo University, Egypt]

#emph[Jan 2025 – Jul 2025]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Directed 35+ engineers; built #strong[ROS1 perception pipeline] and #strong[CAN link] \(Jetson–STM32\).],[Integrated #strong[MATLAB\/SolidWorks models] with URDF for ROS; enabled energy-efficient #strong[velocity profiling].],[Deployed #strong[CARLA-in-Docker] and automated workflows with #strong[Python\/Bash], cutting integration time by 40\%.],[Achieved #strong[3rd place globally] in Shell Eco-marathon Autonomous Programming Competition 2025.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #emph[Leader of Autonomous Development Team]
  ],
  right-content: [
    #emph[Jul 2024 – Jan 2025]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Recruited\/mentored 23 engineers; shifted to #strong[Agile], reducing onboarding by 80\%.],[Launched 3 projects: #strong[system optimization, velocity-energy profiling, embedded integration].],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #emph[Member of Autonomous Development Control Team]
  ],
  right-content: [
    #emph[Sep 2022 – Jul 2024]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Built ROS1 base for testing autonomous vehicle control algorithms.],[Applied #strong[engine performance map] to automate driving parameter calculations for efficient cycles.],[Implemented #strong[PID \(longitudinal\)] & #strong[Stanley \(lateral\)] controllers, boosting efficiency by 300\%.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[SLB Company \(Schlumberger\)]

#emph[Production Systems Intern]
  ],
  right-content: [
    #emph[6th of October, Egypt]

#emph[Jul 2024 – Aug 2024]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Leading global provider of technology for reservoir characterization, drilling, production, and processing])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Worked with #strong[cross-cultural teams] on casing strings & hydraulic liner hangers, for wellbore integrity.],[Gained hands-on knowledge of TRSCSSVs, bridge plugs, packers and subsea devices.],[Conducted electrical testing on #strong[ESP motors & pumps], #strong[presented] results to managers.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Egyptian Atomic Energy Authority]

#emph[Mechanical Engineering Intern]
  ],
  right-content: [
    #emph[Nasr City, Egypt]

#emph[Apr 2023 – May 2023]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Researched nuclear reactor designs and heat-transfer systems.],[Presented comparative analysis of reactor trade-offs to senior engineers.],)
  ],
)



== Projects


#two-col-entry(
  left-content: [
    #strong[Autonomous Tow Tractor - Graduation Project]
  ],
  right-content: [
    #emph[Nov 2024 – Jul 2025]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#link("https://github.com/GP-Autonomous-Tow-Tractor/tow_tractor_ws")[#emph[https:\/\/github.com\/GP-Autonomous-Tow-Tractor\/tow\_tractor\_ws]] \

#v(-design-text-leading)\

#v(-design-text-leading)Designed an autonomous tow tractor using ROS2 & real hardware for #strong[material handling].])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Built #strong[ROS2 system] integrating #strong[Gazebo sim, Nav2, SLAM Toolbox] for navigation & mapping.],[Modeled tractor with #strong[URDF\/Xacro], implementing rear-wheel steering & differential drive.],[Developed #strong[sensor drivers] \(IMU, LiDAR, encoders, camera\) with Kalman filter for odometry.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Autonomous Vehicle Traffic-Aware Control System - Shell Eco Racing Team]
  ],
  right-content: [
    #emph[May 2025]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#link("https://www.youtube.com/watch?v=0uErVfB_nWY")[#emph[https:\/\/www.youtube.com\/watch?v=0uErVfB\_nWY]] \

#v(-design-text-leading)\

#v(-design-text-leading)Traffic-aware path planning & control for autonomous vehicles.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed #strong[traffic logic] in ROS with real-time path planning & collision avoidance.],[Enhanced control with #strong[longitudinal\/lateral controllers] for dynamic responses.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Hardware Python Library - Graduation Project, Shell Eco Racing Team]
  ],
  right-content: [
    #emph[Apr 2025]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#link("https://github.com/m7moud-mostafa/hardware")[#emph[https:\/\/github.com\/m7moud-mostafa\/hardware]]\

#v(-design-text-leading)\

#v(-design-text-leading) Python library for modular sensor & actuator integration on embedded robotics platforms.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed an #strong[OOP Python library] with Serial, SPI & CAN drivers for #strong[Raspberry Pi, Jetson Xavier]],[Implemented low-level #strong[buffering, framing, error handling] and high-level sensor\/actuator APIs.],[Provided extensible interfaces with #strong[logging, connection mgmt, auto message handling].],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Bash Shell Interpreter - ALX]
  ],
  right-content: [
    #emph[Mar 2024]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#link("https://github.com/m7moud-mostafa/simple_shell")[#emph[https:\/\/github.com\/m7moud-mostafa\/simple\_shell]]\

#v(-design-text-leading)\

#v(-design-text-leading) UNIX command line interpreter project in C.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed a practical #strong[UNIX shell] supporting #strong[interactive & non-interactive modes].],[Integrated system calls to manage processes, environment variables, and program execution.],[Implemented built-in functions with argument parsing and PATH command execution, achieving 120\% project score.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Autonomous Vehicle Control ROS Package - Shell Eco Racing Team]
  ],
  right-content: [
    #emph[Feb 2024]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Control system for Shell Eco-racing vehicle.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed #strong[PID + Stanley controllers] in ROS, boosting energy efficiency #strong[3×].],[Tested system in #strong[CARLA Simulator] with Python\/Linux integration.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Energy Performance Evaluation ROS Package - Shell Eco Racing Team]
  ],
  right-content: [
    #emph[Jan 2024]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [ROS package for vehicle energy metrics.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Built ROS package for #strong[efficiency & distance analysis] using Python + CARLA.],[Enabled #strong[real-time monitoring, data logging, Matlab analysis] for performance evaluation.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Designing Mechanical Press Machine - Mechanical Design Project]
  ],
  right-content: [
    #emph[Apr 2023]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#link("https://drive.google.com/drive/folders/1-v-dgZtKch2yg0wYo3KupjW7MLcKM4Bl")[#emph[https:\/\/drive.google.com\/drive\/folders\/1-v-dgZtKch2yg0wYo3KupjW7MLcKM4Bl]]])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed #strong[CAD assembly] in SolidWorks; performed #strong[motion study & FEA safety checks].],[Produced exploded views & working drawings for manufacturing.],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming:] Python, C\/C++, Git, Bash Scripting, Supervised ML, Pandas, NumPy, URDF, XACRO, SQL]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Software\/Hardware Tools:] ROS 1, ROS 2, Gazebo, CARLA, Nav2, Microsoft Planner, Microsoft Office, SolidWorks, MATLAB, Linux OS, Jetson Xavier, Raspberry Pi, Arduino, Serial, CAN]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Concepts:] Autonomous Navigation, Control Systems, Data Analysis, OOP, Data Structures, Sensor Fusion, SLAM, State Estimation]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Soft Skills:] Leadership, Team Collaboration, Adaptability, Problem-Solving, Presentation, Communication, Attention to Detail, Agile, Fast Learner]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] English, Arabic]
)


== Certifications


#one-col-entry(
  content: [- State Estimation and Localization for Self-Driving Cars - University of Toronto, Coursera],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Introduction to Self-Driving Cars - University of Toronto, Coursera],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Supervised Machine Learning - Stanford Online, Coursera],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Data Analysis Professional Nanodegree - FWD, Udacity],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Software Engineering Program - ALX],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Git and GitHub - Google, Coursera],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Machine Design - Georgia Institute of Technology, Coursera],
)


== Extracurricular Activities


#two-col-entry(
  left-content: [
    #strong[Ministry of Youth and Sports, Egypt]

#emph[COP27 Organizer]
  ],
  right-content: [
    #emph[Egypt]

#emph[Sep 2022 – Nov 2022]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Volunteered as part of the youth team organizing the UN COP27 Climate Summit in Egypt.],[Supported event logistics and served as an on-ground organizer during the conference.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Technical Center for Career Development \(TCCD\)]

#emph[Graphic Designer]
  ],
  right-content: [
    #emph[Cairo University, Egypt]

#emph[Sep 2021 – Jul 2022]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Created tens of posters and designs using Photoshop and Illustrator to elevate social media advertising efforts.],[Coordinated 5 technical events such as Math Day and Job Fair events.],)
  ],
)



