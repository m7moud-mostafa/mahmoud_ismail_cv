
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
#let design-section-titles-vertical-space-below = 0.3cm
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
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "◦"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = false
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 1cm
#let design-page-bottom-margin = 1cm
#let design-page-left-margin = 1.3cm
#let design-page-right-margin = 1.3cm
#let design-page-show-last-updated-date = false
#let design-page-show-page-numbering = true
#let design-links-underline = true
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
  [#box(original-link("https://linkedin.com/in/linkedin.com/in/ma7moud-mostafa")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)linkedin.com\/in\/ma7moud-mostafa])],
  [#box(original-link("https://github.com/github.com/m7moud-mostafa")[#fa-icon("github", size: 0.9em) #h(0.05cm)github.com\/m7moud-mostafa])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [I am an aspiring engineering undergrad with hands-on experience in ROS, navigation, SLAM, and control. I have successfully led the development of autonomous vehicle systems from simulation to hardware integration. I am continuously seeking challenging opportunities within the autonomous robotics field where I can further enhance my skills and contribute to innovative projects]
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
    #strong[Shell Eco Racing Team \(CUERT\)]

#emph[Director of Autonomous Teams]
  ],
  right-content: [
    #emph[Cairo University, Egypt]

#emph[Jan 2025 – July 2025]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [A student-led racing team focused on the development of eco friendly racing vehicles.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Led 35 engineering students across Development and Embedded teams, fostering teamwork and clear communication.],[Migrated CARLA system to a Docker-based setup, resolving Ubuntu dependencies issues and enabled seamless team transitions.],[Developed Bash\/Python tools to automate integration and simplify development workflows.],[Drove completion of 3+ development projects managing testing and documentation, built ROS perception base for AI model deployment.],[Conducted energy consumption calculations for vehicle model supporting energy-efficient velocity profiling project.],[Repaired corrupted Jetson Xavier device, restoring hardware and software functionality to enable autonomous system deployment.],[Developed CAN communication system between the Xavier and STM32 microcontroller for autonomous vehicle control.],[Initiated vehicle modeling project overseeing MATLAB\/SolidWorks models with URDF conversion for ROS integration.],[Achieved 3rd place globally in the Shell Eco-marathon Autonomous Programming Competition 2025.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #emph[Leader of Autonomous Development Team]
  ],
  right-content: [
    #emph[July 2024 – Jan 2025]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Hired and led 23 engineers across multiple disciplines for a Level 3+ autonomous car competition.],[Mentored with sprint-based learning roadmaps and reviews, cutting onboarding time 80\% versus prior season.],[Initiated three cross-functional projects: system optimization, energy-cost velocity profiling, and embedded team integration.],[Shifted from waterfall to agile methodology, accomplishing more with fewer resources across multiple projects.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #emph[Member of Autonomous Development Control Team]
  ],
  right-content: [
    #emph[Sept 2022 – July 2024]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Established the software base structure to allow building and assessing control algorithms using ROS 1 packages.],[Implemented a PID controller for longitudinal movements and the Stanley algorithm for lateral movements, boosting energy efficiency by 300\%.],[Utilized the engine performance map to automate the calculation of driving parameters for efficient driving cycles.],)
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

#emph[July 2024 – Aug 2024]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Leading global provider of technology for reservoir characterization, drilling, production, and processing])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Coordinated with cross cultural teams to learn about casing strings and hydraulic liner hangers, ensuring wellbore integrity.],[Developed knowledge of TRSCSSVs, Bridge plugs and production packers for well completion.],[Conducted phase-to-phase and DC tests on ESP induction motors and centrifugal pumps, presenting results to senior engineers.],[Supported subsea casing head, spool & Christmas tree assembly to optimize hydrocarbon flow.],)
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
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [National authority responsible for the development of nuclear energy applications])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Studied four nuclear reactor types, their core components, design consideration, cooling loops and heat-transfer systems.],[Collaborated in hands-on training and expert discussions to refine technical communication.],[Presented the four nuclear reactor types, highlighting operational principles, benefits and trade-offs.],)
  ],
)



== Projects


#two-col-entry(
  left-content: [
    #strong[Autonomous Tow Tractor - Graduation Project]
  ],
  right-content: [
    #emph[Nov 2024 – July 2025]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#link("https://github.com/GP-Autonomous-Tow-Tractor/tow_tractor_ws")[#emph[https:\/\/github.com\/GP-Autonomous-Tow-Tractor\/tow\_tractor\_ws]] \

#v(-design-text-leading)\

#v(-design-text-leading)#emph[A graduation project focused on designing an autonomous tow tractor]])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed ROS2-based autonomous tow tractor system, integrating simulation \(Gazebo\), real-time hardware control, and navigation.],[Developed custom URDF\/Xacro robot models implementing rear-wheel steering and differential drive control algorithms.],[Built a ROS2 package for sensor data intake and actuator commands using my hardware Python library's serial drivers.],[Integrated navigation\/mapping with Nav2 & SLAM Toolbox for autonomous operation.],[Integrated MPU6050 IMU, RaspberryPi camera, wheel encoders, and LiDAR with a Kalman filter for accurate odometry data.],)
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

#v(-design-text-leading)#emph[A project focusing on traffic-aware control systems for autonomous vehicles]])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed advanced traffic handling logic for an autonomous vehicle in ROS, integrating real-time path planning and collision avoidance.],[Enhanced control module with traffic-aware longitudinal and lateral controllers for dynamic autonomous response.],)
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
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#link("https://github.com/m7moud-mostafa/hardware")[#emph[https:\/\/github.com\/m7moud-mostafa\/hardware]]])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Designed an OOP Python library with Serial, SPI & CAN drivers using inheritance and mixins for modular, reusable code.],[Developed robust low-level drivers \(buffer management, message framing, error handling\) and high-level abstractions for sensors \(IMU, encoders\) and for sending actuators commands.],[Designed extensible, testable interfaces for adding new hardware drivers, with centralized logging, connection management, and automated message handling for reliable robotics integration.],)
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
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#link("https://github.com/m7moud-mostafa/simple_shell")[#emph[https:\/\/github.com\/m7moud-mostafa\/simple\_shell]]])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed a practical UNIX command line interpreter using C programming to mimic basic shell functions.],[Integrated system calls for managing processes, configuring environmental variables , executing programs in a shell setting.],[Implemented essential built-in functions, achieved argument parsing, and allowed the execution of PATH commands in Interactive or Non-interactive mode, which achieved 120\% score for this project.],)
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
    #v(design-highlights-top-margin);#highlights([Developed a PID controller and Stanley algorithm within the ROS Control package, optimizing the energy efficiency for autonomous driving.],[Utilized Linux, Python, and the CARLA Simulator to develop and test the control system.],[Optimized the energy efficiency of the control system, which increased the efficiency 3 times the previous system.],)
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
    #v(design-highlights-top-margin);#highlights([Developed a comprehensive ROS package to assess energy efficiency and distance metrics of autonomous vehicles, utilizing Python and interfacing with the CARLA simulator.],[Proposed data collection for further Matlab analysis, real-time monitoring, and visualization for the car performance.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Energy Performance Evaluation ROS Package - Shell Eco Racing Team]
  ],
  right-content: [
    #emph[Apr 2023]
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#link("https://drive.google.com/drive/folders/1-v-dgZtKch2yg0wYo3KupjW7MLcKM4Bl")[#emph[https:\/\/drive.google.com\/drive\/folders\/1-v-dgZtKch2yg0wYo3KupjW7MLcKM4Bl]]])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Resolved team’s calculations into a CAD design using SOLIDWORKS, including building and assembling the parts.],[Conducted a motion study, created the exploded view and working drawings, and ensured the design's safety with finite element analysis.],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming:] Python, C\/C++,, Git, Bash Scripting, Supervised ML, Pandas, NumPy, URDF, XACRO, SQL]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Software Tools:] ROS 1, ROS 2, Gazebo, CARLA, Nav2, Microsoft Planner, Microsoft Office, SolidWorks, MATLAB, Linux OS]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Embedded Tools:] Jetson Xavier, Raspberry Pi, Arduino, Serial, CAN]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Concepts:] Autonomous Navigation, Control Systems, Data Analysis, OOP, Data Structures, Sensor Fusion, SLAM, State Estimation]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Soft Skills:] Leadership, Team Collaboration, Adaptability, Problem-Solving, Presentation, Communication, Attention to Details, Agile, Fast Learner]
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

#emph[Sept 2022 – Nov 2022]
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

#emph[Sept 2021 – July 2022]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Created tens of posters and designs using Photoshop and Illustrator to elevate social media advertising efforts.],[Coordinated 5 technical events such as Math Day and Job Fair events.],)
  ],
)



