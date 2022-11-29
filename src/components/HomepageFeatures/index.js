import React from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';

const FeatureList = [
  {
    title: 'Free and Open Source',
    imagePath: 'https://cdn.discordapp.com/attachments/670023265455964198/983233820792864768/ComputerVector.png',
    description: (
      <>
        The code within this repository is completely free and open to the public. Credit attribution is appreciated but not required.
      </>
    ),
  },
  {
    title: 'Developer: Prooheckcp',
    imagePath: 'https://cdn.discordapp.com/attachments/670023265455964198/983201962826793030/prooheckcpChubby.png',
    description: (
      <>
        This code is being actively maintained by "Prooheckcp". A full-time Portuguese game developer
      </>
    ),
  },
];

function Feature({imagePath, title, description}) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <img className={styles.featureSvg} src={imagePath}/>
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className={styles.center}>
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
